page 50104 CustomerOrderLinesPosted
{
    Caption = 'Customer Order Lines';
    PageType = ListPart;
    UsageCategory = Lists;
    SourceTable = CustomerOrderLinePosted;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    Caption = 'Quantity';
                }
                field(UnitCost; Rec.UnitCost)
                {
                    ApplicationArea = All;
                    Caption = 'Unit Cost';
                }
                field(BuyFromVendorNo; Rec.BuyFromVendorNo)
                {
                    ApplicationArea = All;
                    Caption = 'Buy from Vendor No.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }

            }
        }
    }
}