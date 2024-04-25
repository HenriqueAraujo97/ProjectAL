page 50101 CustomerOrderHeader
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CustomerOrderHeader;
    Caption = 'Customer Order';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(CustomerNo; Rec.CustomerNo)
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field(OrderAmountValue; Rec.OrderAmountValue)
                {
                    ApplicationArea = All;

                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = All;

                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;

                }
            }

            part(CustomerOrderLines; "CustomeOrderLines")
            {
                SubPageLink = DocumentNo = field(No);
                UpdatePropagation = Both;

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


    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = All;
                Image = PostedOrder;

                trigger OnAction()
                var
                    CustomerOrderPost: Codeunit CustomerOrderPost;
                    ErroMsg: Label 'The Order Amount can not be 0';
                    Answer: Boolean;
                    ConfirmMsg: Label 'Do you want to Post the Customer Order?';
                begin
                    if Rec.OrderAmountValue = 0 then
                        Error(ErroMsg);
                    Answer := not Dialog.Confirm(ConfirmMsg, true, Rec.No);

                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        NoSeries: Codeunit "No. Series";
        HenriqueAppSetup: Record HenriqueAppSetup;
    begin
        HenriqueAppSetup.Get();
        Rec.No := NoSeries.GetNextNo(HenriqueAppSetup.SerialNo);
    end;
}