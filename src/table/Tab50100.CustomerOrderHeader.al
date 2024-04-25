table 50100 CustomerOrderHeader
{
    DataClassification = ToBeClassified;

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
            Caption = 'Customer No.';
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                Customer.get(Rec.CustomerNo);
                Name := Customer.Name
            end;

        }
        field(5; Name; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(10; OrderAmountValue; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum(CustomerOrderLine.UnitCost where(DocumentNo = field(No)));
            Caption = 'Order Amount';
            Editable = false;
        }
        field(15; Contact; Integer)
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