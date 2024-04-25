page 50100 CustomeOrderLines
{
    Caption = 'Customer Order Lines';
    PageType = ListPart;
    UsageCategory = Lists;
    SourceTable = CustomerOrderLine;

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
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
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