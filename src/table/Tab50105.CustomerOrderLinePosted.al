table 50105 CustomerOrderLinePosted
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; LineNo; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; DocumentNo; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(5; No; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(10; Quantity; decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(15; UnitCost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; BuyFromVendorNo; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(25; Description; text[100])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; LineNo, DocumentNo)
        {
            Clustered = true;
        }
    }
}