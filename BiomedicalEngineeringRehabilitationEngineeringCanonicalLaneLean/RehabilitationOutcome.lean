import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean

structure RehabilitationOutcomePackage where
  functionalAssessment : Type u
  qualityOfLifeMeasure : Type v
  satisfactionScore : Type w
  outcomeReliabilityValid : Prop
  responsivenessValid : Prop
  clinicalMeaningfulnessValid : Prop

structure RehabilitationOutcomeEvidence (R : RehabilitationOutcomePackage) where
  outcomeReliabilityValidClosed : R.outcomeReliabilityValid
  responsivenessValidClosed : R.responsivenessValid
  clinicalMeaningfulnessValidClosed : R.clinicalMeaningfulnessValid

def RehabilitationOutcomeClosed (R : RehabilitationOutcomePackage) : Prop :=
  R.outcomeReliabilityValid ∧ R.responsivenessValid ∧ R.clinicalMeaningfulnessValid

theorem rehabilitation_outcome_closed_from_evidence (R : RehabilitationOutcomePackage)
    (E : RehabilitationOutcomeEvidence R) : RehabilitationOutcomeClosed R := by
  exact And.intro E.outcomeReliabilityValidClosed
    (And.intro E.responsivenessValidClosed E.clinicalMeaningfulnessValidClosed)

end BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean
end HautevilleHouse