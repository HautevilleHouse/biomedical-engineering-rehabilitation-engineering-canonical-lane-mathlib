import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean

structure DiagnosticTest where
  sensitivity : ℝ
  specificity : ℝ
  prevalence : ℝ

def positivePredictiveValue (t : DiagnosticTest) : ℝ :=
  (t.sensitivity * t.prevalence) / (t.sensitivity * t.prevalence + (1 - t.specificity) * (1 - t.prevalence))

structure DiagnosticEvidence (t : DiagnosticTest) where
  sensitivityInUnit : t.sensitivity ∈ Set.Ioo 0 1
  specificityInUnit : t.specificity ∈ Set.Ioo 0 1
  prevalenceInUnit : t.prevalence ∈ Set.Ioo 0 1

def DiagnosticClosed (t : DiagnosticTest) : Prop :=
  t.sensitivity > 0 ∧ t.sensitivity < 1 ∧ t.specificity > 0 ∧ t.specificity < 1 ∧ t.prevalence > 0 ∧ t.prevalence < 1

theorem diagnostic_closed_from_evidence (t : DiagnosticTest) (E : DiagnosticEvidence t) : DiagnosticClosed t :=
  by
    have hs : t.sensitivity > 0 := Set.mem_Ioo_iff.mp E.sensitivityInUnit).1
    have hs2 : t.sensitivity < 1 := Set.mem_Ioo_iff.mp E.sensitivityInUnit).2
    have hsp : t.specificity > 0 := Set.mem_Ioo_iff.mp E.specificityInUnit).1
    have hsp2 : t.specificity < 1 := Set.mem_Ioo_iff.mp E.specificityInUnit).2
    have hp : t.prevalence > 0 := Set.mem_Ioo_iff.mp E.prevalenceInUnit).1
    have hp2 : t.prevalence < 1 := Set.mem_Ioo_iff.mp E.prevalenceInUnit).2
    exact And.intro hs (And.intro hs2 (And.intro hsp (And.intro hsp2 (And.intro hp hp2))))

end BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean
end HautevilleHouse
