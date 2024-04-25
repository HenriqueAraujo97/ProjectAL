table 50104 CustomerOrderHeaderPosted
{
    DataClassification = ToBeClassified;
    LookupPageId = CustomerOrderListPosted;
    DrillDownPageId = CustomerOrderListPosted;

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; CustomerNo; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;

        }
        field(5; Name; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(15; Contact; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(20; AmountPaid; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(25; Email; Code[30])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

}