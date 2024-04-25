table 50102 CustomerOrderPayment
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer)
        {
            DataClassification = ToBeClassified;
            Autoincrement = true;

        }
        field(2; DocumentNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No.';
            Editable = false;

        }
        field(3; PaymentAmount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Payment Amount';
        }

        field(4; CustomerNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer No.';
            Editable = false;

        }
        field(5; CustomerName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Name';
            Editable = false;

        }
        field(6; TypeOfPayment; Enum TypeOfPayment)
        {
            DataClassification = ToBeClassified;
            Caption = 'Type Of Payment';
        }

        field(10; Address; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15; PrepaymentDueDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Prepayment Due Date';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }
}