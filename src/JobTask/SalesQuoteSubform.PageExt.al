namespace Wanamics.WanaProj.JobTask;

using Microsoft.Sales.Document;
pageextension 87562 "wan Sales Quote Subform" extends "Sales Quote Subform"
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
