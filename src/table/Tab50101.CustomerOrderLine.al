table 50101 CustomerOrderLine
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;

        }
        field(2; DocumentNo; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(5; No; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;
            trigger OnValidate()
            var
                Item: Record Item;
            begin
                If Item.Get(Rec.No) then begin
                    Rec.Validate(Description, Item.Description);
                end;
            end;
        }
        field(10; Quantity; decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Item: Record Item;
            begin
                If Item.Get(Rec.No) then begin
                    Rec.Validate(UnitCost, (item."Unit Cost" * Quantity));
                end;
            end;

        }
        field(15; UnitCost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; BuyFromVendorNo; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;

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