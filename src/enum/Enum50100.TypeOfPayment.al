enum 50100 TypeOfPayment
{
    Extensible = true;

    value(0; VISA)
    {
        Caption = 'Visa';
    }
    value(1; CreditCard)
    {
        Caption = 'Credit Card';
    }
    value(2; ATM)
    {
        Caption = 'ATM';
    }

}