pageextension 50102 "Customer Statistics FactBoxExt" extends "Customer Statistics FactBox"
{
    layout
    {
        addafter("Balance (LCY)")
        {
            field(PaidAmount; Rec.PaidAmount)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Paid Amount';
            }

        }
    }
}