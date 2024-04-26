report 50100 CustomerOrderReceipt
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './src/ReportLayout/CustomerOrderReceipt.rdl';
    Caption = 'Customer Order Receipt';

    dataset
    {
        dataitem(CustomerOrderHeaderPosted; CustomerOrderHeaderPosted)
        {
            column(No; No)
            {

            }
            column(CustomerNo; CustomerNo)
            {

            }
            column(Name; Name)
            {

            }
            column(VAT; VAT)
            {

            }
            column(AmountPaid; AmountPaid)
            {

            }
            column(AmountToPay; AmountToPay)
            {

            }
            column(Email; Email)
            {

            }
            column(Picture; CompanyInformation.Picture)
            {

            }
            dataitem(CustomerOrderLinePosted; CustomerOrderLinePosted)
            {
                DataItemLinkReference = CustomerOrderHeaderPosted;
                DataItemLink = DocumentNo = field(No);

                column(ItemNo; No)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(UnitCost; UnitCost)
                {

                }
                column(BuyFromVendorNo; BuyFromVendorNo)
                {

                }
                column(Description; Description)
                {

                }
            }
            dataitem(CustomerOrderPayment; CustomerOrderPayment)
            {
                column(DocumentNoPayment; DocumentNo)
                {

                }
                column(TypeOfPayment; TypeOfPayment)
                {

                }
                column(PaymentAmount; PaymentAmount)
                {

                }
                column(AddressPayment; Address)
                {

                }
                column(PrepaymentDueDate; PrepaymentDueDate)
                {

                }
                trigger OnPreDataItem()
                begin
                    CustomerOrderPayment.SetFilter(DocumentNo, '%1|%2', CustomerOrderHeaderPosted.OldDocNo, CustomerOrderHeaderPosted.No);
                end;
            }
            trigger OnPreDataItem()
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
            end;
        }
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = sorting(Number) where(Number = const(1));
            column(ShowPaymentJournal; ShowPaymentJournal)
            {

            }
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(ShowPaymentJournal; ShowPaymentJournal)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Payment Journal';
                    }
                }
            }
        }
    }

    labels
    {
        NoLbl = 'Document No.';
        CustomerNoLbl = 'Customer No.';
        NameLbl = 'Name';
        VATLbl = 'VAT';
        AmountPaidLbl = 'Amount Paid';
        AmountToPayLbl = 'Amount To Pay';
        EmailLbl = 'Email';
        ItemNoLbl = 'Item No.';
        QuantityLbl = 'Quantity';
        UnitCostLbl = 'Unit Cost';
        BuyFromVendorNoLbl = 'Buy From Vendor No.';
        DescriptionLbl = 'Description';
        TypeOfPaymentLbl = 'Type Of Payment';
        PaymentAmountLbl = 'Payment Amount';
        AddressLbl = 'Address';
        PrepaymentDueDateLbl = 'Prepayment Due Date';
        PaymentJournalLbl = 'Payment Journal';
    }

    var
        CompanyInformation: Record "Company Information";
        ShowPaymentJournal: Boolean;
}