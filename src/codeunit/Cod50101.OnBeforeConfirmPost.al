codeunit 50101 OnBeforeConfirmPost
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", 'OnBeforeConfirmPost', '', false, false)]
    local procedure OnBeforeConfirmPost(var SalesHeader: Record "Sales Header"; var DefaultOption: Integer; var Result: Boolean; var IsHandled: Boolean)
    var
        CustomerOrderHeaderPosted: Record CustomerOrderHeaderPosted;
        TextConfirmation: Label 'Already exist a Posted Customer Order with that cliente, do you want to continue?';
        Answer: Boolean;
    begin
        CustomerOrderHeaderPosted.SetRange(CustomerOrderHeaderPosted.Name, SalesHeader."Sell-to Customer No.");
        if CustomerOrderHeaderPosted.FindSet() then
            IsHandled := not Dialog.Confirm(TextConfirmation, true, SalesHeader."Sell-to Customer Name");
    end;
}