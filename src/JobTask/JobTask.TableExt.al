namespace Wanamics.WanaProj.JobTask;

using Microsoft.Projects.Project.Job;
tableextension 87500 "wan Job Task" extends "Job Task"
{
    procedure wanGetDefault(pJobNo: Code[20]; pGlobalDimension1Code: Code[20]; pGlobalDimension2Code: Code[20]): Boolean
    begin
        if pJobNo = '' then
            exit;
        SetRange("Job No.", pJobNo);
        SetRange("Job Task Type", "Job Task Type"::Posting);
        if pGlobalDimension1Code <> '' then
            SetRange("Global Dimension 1 Code", pGlobalDimension1Code);
        if pGlobalDimension2Code <> '' then
            SetRange("Global Dimension 2 Code", pGlobalDimension2Code);
        Case Count of
            1:
                exit(FindFirst());
            0:
                begin
                    if pGlobalDimension2Code <> '' then begin
                        SetRange("Global Dimension 2 Code");
                        if Count = 1 then
                            exit(FindFirst);
                    end;
                    if pGlobalDimension1Code <> '' then begin
                        SetRange("Global Dimension 1 Code");
                        if Count = 1 then
                            exit(FindFirst);
                    end;
                end;
            else
                exit(false);
        end;
    end;
}
