page 50107 CustomerOrderHeaderFactBox
{
    PageType = CardPart;
    SourceTable = CustomerOrderHeader;
    Caption = 'Customer Order Factbox';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;

                }
                field(CustomerNo; Rec.CustomerNo)
                {
                    ApplicationArea = All;
                    TableRelation = Customer;
                    trigger OnValidate()
                    var
                        Customer: Record Customer;
                    begin
                        Customer.get(Rec.CustomerNo);
                        Rec.Name := Customer.Name
                    end;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(OrderAmountValue; Rec.OrderAmountValue)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}