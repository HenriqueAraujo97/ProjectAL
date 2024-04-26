reportextension 50100 CustomerListExt extends "Customer - List"
{
    dataset
    {
        add(Customer)
        {
            column(NoOfOrders; NoOfOrders)
            {

            }
            column(PaidAmount; PaidAmount)
            {

            }
            column(City; City)
            {

            }
        }
        addlast(Customer)
        {
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(COMPANYNAME2; COMPANYPROPERTY.DisplayName())
                {

                }
                column(PrintCompany; PrintCompany)
                {

                }
            }
        }
    }

    requestpage
    {
        layout
        {
            addfirst(Content)
            {
                field(PrintCompany; PrintCompany)
                {
                    ApplicationArea = All;
                    Caption = 'Show Internal Information';
                    ShowCaption = true;
                }
            }
        }
    }


    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './src/ReportLayout/CustomerList.rdl';
        }
    }
    labels
    {
        NoOfOrdersLbl = 'No Of Orders';
        PaidAmountLbl = 'Paid Amount';
        CityLbl = 'City';
    }

    var
        PrintCompany: Boolean;
}