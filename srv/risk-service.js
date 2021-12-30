//imports
const cds = require("@sap/cds");

module.exports = cds.service.impl(async function () {
    // eslint-disable-next-line no-unused-vars
    const { Risks, BusinessPartners } = this.entities;

    this.after("READ", Risks, (data) => {

        const risks = Array.isArray(data) ? data : [data];

        risks.forEach((risk) => {
            risk.criticality = risk.impact > 10000 ? 1 : 2;

        }

        );
    });


    const BPsrv = await cds.connect.to("API_BUSINESS_PARTNER");

    this.on("READ", BusinessPartners, async (req) => {
        req.query.where("LastName <> '' and FirstName <> '' ");


        return await BPsrv.transaction(req).send(
            {
                query: req.query,
                headers: {
                    apikey: process.env.apikey
                }
            },
        );

    });

  //   this.on("READ", Risks, async (req) => {
        try {
            const res = await next();
            await Promise.all(
                res.map(async (risk) => {
                    const bp = await BPsrv.transaction(req).send(
                        {
                            query: SELECT.one(this.entities.BusinessPartners)
                                .where({ BusinessPartner: risk.bp_BusinessPartner })
                                .columns(["BusinessPartner", "LastName", "FirstName"]),
                            headers: {
                                apikey: process.env.apikey
                            }
                        },
                    );
                    risk.bp = bp;
                })
            );
        } catch (error) {

        }
  //   });

});
