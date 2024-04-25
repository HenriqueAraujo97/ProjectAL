page 50102 CustomerOrdersList
{
    ApplicationArea = All;
    Caption = 'Customer Orders List';
    PageType = List;
    SourceTable = CustomerOrderHeader;
    UsageCategory = Lists;
    Editable = false;
    CardPageId = CustomerOrderHeader;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(OrderAmountValue; Rec.OrderAmountValue)
                {
                    ToolTip = 'Specifies the value of the OrderAmountValue field.';
                }
                field(VAT; Rec.VAT)
                {
                    ToolTip = 'Specifies the value of the VAT field.';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.';
                }
            }
        }
        area(Factboxes)
        {
            part(ItemPicture; "Item Picture")
            {
                ApplicationArea = all;
                Caption = 'Picture';
                // Provider = SalesLines;
                // SubPageLink = "No." = field("No");
            }
        }
    }
}
