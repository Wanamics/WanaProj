namespace Wanamics.WanaProj.JobTask;

using Microsoft.Purchases.Document;
pageextension 87580 "wan Purch. Order JobTask" extends "Purchase Order"
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
