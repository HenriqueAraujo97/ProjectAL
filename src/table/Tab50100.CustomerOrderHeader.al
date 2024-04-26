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
                if Customer.get(Rec.CustomerNo) then
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
        field(15; VAT; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(25; Email; Code[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;

        }

    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        CustomerOrderLine: Record CustomerOrderLine;
    begin
        CustomerOrderLine.SetRange(DocumentNo, Rec.No);
        CustomerOrderLine.DeleteAll();
    end;
}