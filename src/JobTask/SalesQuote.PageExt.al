namespace Wanamics.WanaProj.JobTask;

using Microsoft.Sales.Document;
pageextension 87563 "wan Sales Quote JobTask" extends "Sales Quote"
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
