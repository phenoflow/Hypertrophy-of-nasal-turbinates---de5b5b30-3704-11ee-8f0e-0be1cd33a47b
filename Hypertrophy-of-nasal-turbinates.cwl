cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  nasal-turbinate-hypertrophy-hypertrophy-of-nasal-turbinates---primary:
    run: nasal-turbinate-hypertrophy-hypertrophy-of-nasal-turbinates---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  hypertrophy-nasal-hypertrophy-of-nasal-turbinates-turbinates---primary:
    run: hypertrophy-nasal-hypertrophy-of-nasal-turbinates-turbinates---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: nasal-turbinate-hypertrophy-hypertrophy-of-nasal-turbinates---primary/output
  hypertrophy-nasal-hypertrophy-of-nasal-turbinates-turbinates---secondary:
    run: hypertrophy-nasal-hypertrophy-of-nasal-turbinates-turbinates---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: hypertrophy-nasal-hypertrophy-of-nasal-turbinates-turbinates---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: hypertrophy-nasal-hypertrophy-of-nasal-turbinates-turbinates---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
