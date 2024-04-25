page 50106 CustomerOrderListPosted
{
    ApplicationArea = All;
    Caption = 'Customer Orders List Posted';
    PageType = List;
    SourceTable = CustomerOrderHeaderPosted;
    UsageCategory = Lists;
    Editable = false;
    CardPageId = CustomerOrderHeaderPosted;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(AmountPaid; Rec.AmountPaid)
                {
                    ToolTip = 'Specifies the value of the Amount Paid field.';
                }
                field(Contact; Rec.Contact)
                {
                    ToolTip = 'Specifies the value of the Contact field.';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.';
                }
            }
        }
        area(Factboxes)
        {
            part(CustomerOrderHeaderFactBox; CustomerOrderHeaderFactBox)
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = No = field(No),
                CustomerNo = field(CustomerNo),
                Name = field(Name);
            }
        }
    }
}