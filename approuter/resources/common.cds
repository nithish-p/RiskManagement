using riskmanagement as rm from '../db/schema';

annotate rm.Risks with {
    id          @title: 'Risk';
	title       @title: 'Title';
    owner       @title: 'Owner';
	prio        @title: 'Priority';
	descr       @title: 'Description';
	miti        @title: 'Mitigation';
    bp          @title: 'Business Partner';
	impact      @title: 'Impact';
}

annotate rm.Mitigations with {
	ID @(
		UI.Hidden,
		Common: {
		Text: descr
		}
	);
	descr       @title: 'Description';
	owner        @title: 'Owner';	
}



annotate rm.Risks with {
	miti @(
		Common: {
			//show text, not id for mitigation in the context of risks
			Text: miti.descr  , TextArrangement: #TextOnly,
			ValueList: {
				Label: 'Mitigations',
				CollectionPath: 'Mitigations',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: miti_ID,
						ValueListProperty: 'ID'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'descr'
					}
				]
			}
		}
	);

    bp @(
		Common: {
			//show text, not id for mitigation in the context of risks
			Text: bp.LastName  , TextArrangement: #TextOnly,
			ValueList: {
				Label: 'Business Partners',
				CollectionPath: 'BusinessPartners',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: bp_BusinessPartner,
						ValueListProperty: 'BusinessPartner'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'LastName'
					},
                    { $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'FirstName'
					}
				]
			}
		}
	);
    



}

using  from './risks/annotations';
using from './common';
