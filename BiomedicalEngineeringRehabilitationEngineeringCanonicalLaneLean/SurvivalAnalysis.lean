import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean

structure SurvivalModel where
  hazardRate : ℝ → ℝ
  baselineHazard : ℝ → ℝ
  covariates : ℝ

def survivalFunction (m : SurvivalModel) (t : ℝ) : ℝ :=
  Real.exp (-∫ s in (0 : ℝ)..t, m.hazardRate s)

structure SurvivalEvidence (m : SurvivalModel) where
  hazardNonnegative : ∀ t, m.hazardRate t ≥ 0
  baselineNonnegative : ∀ t, m.baselineHazard t ≥ 0
  covariatesBounded : |m.covariates| ≤ 1

def SurvivalClosed (m : SurvivalModel) : Prop :=
  (∀ t, m.hazardRate t ≥ 0) ∧ (∀ t, m.baselineHazard t ≥ 0) ∧ |m.covariates| ≤ 1

theorem survival_closed_from_evidence (m : SurvivalModel) (E : SurvivalEvidence m) : SurvivalClosed m :=
  by
    exact And.intro E.hazardNonnegative (And.intro E.baselineNonnegative E.covariatesBounded)

end BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean
end HautevilleHouse
