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
            Caption = 'No';
        }
        field(2; CustomerNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer No';
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.get(CustomerNo) then
                    Validate(Name, Customer.Name)
            end;
        }
        field(3; OldDocNo; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Name; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
        }
        field(15; VAT; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'VAT';
        }
        field(20; AmountPaid; Decimal)
        {
            Caption = 'Amount Paid';
        }
        field(21; AmountToPay; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount To Pay';
        }

        field(25; Email; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Email';
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