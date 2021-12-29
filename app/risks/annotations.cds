using RiskService as service from '../../srv/risk-service';

annotate RiskService.Risks with @(UI : {
    HeaderInfo      : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Risk',
        TypeNamePlural : 'Risks',
        Title          : {
            $Type : 'UI.DataField',
            Value : title,
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : descr,
        },
    },
    SelectionFields : [prio],
    Identification  : [{Value : title}],
    LineItem        : [
        {
            $Type : 'UI.DataField',
            Label : 'title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : miti_ID
        },
        {
            $Type : 'UI.DataField',
            Value : bp_BusinessPartner
        },
        {
            $Type : 'UI.DataField',
            Value : owner,
        },
        {
            $Type       : 'UI.DataField',
            Value       : prio,
            Criticality : criticality
        },

    ]
});

annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {Value : miti_ID},
            {Value : owner},
            {Value : bp_BusinessPartner},

            {
                Value       : impact,
                Criticality : criticality
            },
            {

                Value       : criticality,
                Criticality : criticality
            },
        ],
    },
    UI.Facets                      : [{
        $Type  : 'UI.ReferenceFacet',
        ID     : 'GeneratedFacet1',
        Label  : 'Main Information',
        Target : '@UI.FieldGroup#GeneratedGroup1',
    }, ]
);
