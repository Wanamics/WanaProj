namespace Wanamics.WanaProj.JobTask;

using Microsoft.Sales.Document;
pageextension 87560 "wan Sales Order JobTask" extends "Sales Order"
{
    layout
    {
        addbefore("Status")
        {
            field("Job No."; Rec."wan Job No.")
            {
                ApplicationArea = Jobs;
                ToolTip = 'Specifies the value of the Job No. field.';
            }
        }
    }
}
