namespace Wanamics.WanaProj.JobTask;

using Microsoft.Sales.Document;
pageextension 87561 "wan Sales Order Subform" extends "Sales Order Subform"
{
    layout
    {
        addbefore("Shortcut Dimension 1 Code")
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = Jobs;
                Editable = true;
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = Jobs;
                Editable = true;
            }
        }
    }
}
