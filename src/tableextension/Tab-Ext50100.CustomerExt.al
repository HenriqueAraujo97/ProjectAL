tableextension 50100 CustomerExt extends Customer
{
    fields
    {
        field(50100; NoOfOrders; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(CustomerOrderHeaderPosted where(CustomerNo = field("No.")));
        }
        field(50101; PaidAmount; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum(CustomerOrderHeaderPosted.AmountPaid where(CustomerNo = field("No.")));
        }
    }
}