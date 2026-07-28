import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean

structure CompartmentModel where
  centralVolume : ℝ
  peripheralVolume : ℝ
  clearance : ℝ
  absorptionRate : ℝ

def drugConcentration (model : CompartmentModel) (t : ℝ) : ℝ :=
  let dose : ℝ := 1.0
  let k := model.clearance / model.centralVolume
  let ka := model.absorptionRate
  dose * (ka / (ka - k)) * ((Real.exp (-k * t)) - (Real.exp (-ka * t))) / model.centralVolume

structure CompartmentModelEvidence (M : CompartmentModel) where
  volumePositive : M.centralVolume > 0 ∧ M.peripheralVolume > 0
  clearanceNonnegative : M.clearance ≥ 0
  absorptionPositive : M.absorptionRate > 0

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.centralVolume > 0 ∧ M.peripheralVolume > 0 ∧ M.clearance ≥ 0 ∧ M.absorptionRate > 0

theorem compartment_model_closed_from_evidence (M : CompartmentModel) (E : CompartmentModelEvidence M) : CompartmentModelClosed M :=
  by
    exact And.intro E.volumePositive.1 (And.intro E.volumePositive.2 (And.intro E.clearanceNonnegative E.absorptionPositive))

end BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean
end HautevilleHouse
