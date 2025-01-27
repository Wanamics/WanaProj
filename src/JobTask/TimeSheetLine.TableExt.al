namespace Wanamics.WanaProj.JobTask;

using Microsoft.Projects.TimeSheet;
using Microsoft.Projects.Project.Job;
using Microsoft.Finance.Dimension;
tableextension 87504 "wan Time Sheet Line" extends "Time Sheet Line"
{
    fields
    {
        modify("Job No.")
        {
            trigger OnAfterValidate()
            var
                JobTask: Record "Job Task";
            begin
                if ("Job No." <> '') and ("Job Task No." = '') then
                    if JobTask.wanGetDefault("Job No.", wanGetDimension("Dimension Set ID", 1), wanGetDimension("Dimension Set ID", 2)) then
                        Validate("Job Task No.", JobTask."Job Task No.");
            end;
        }
    }
    local procedure wanGetDimension(pDimensionSetID: Integer; pGlobalDimensionNo: Integer): Code[20]
    var
        DimensionSetEntry: Record "Dimension Set Entry";
    begin
        DimensionSetEntry.SetRange("Dimension Set ID", pDimensionSetID);
        DimensionSetEntry.SetRange("Global Dimension No.", pGlobalDimensionNo);
        if FindFirst() then
            exit(DimensionSetEntry."Dimension Value Code");
    end;
}
