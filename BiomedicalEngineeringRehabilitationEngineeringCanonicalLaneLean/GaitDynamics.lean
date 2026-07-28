import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean

structure GaitCycle where
  stancePhaseDuration : Float
  swingPhaseDuration : Float
  stepLength : Float
  cadence : Float

def GaitCycleClosed (g : GaitCycle) : Prop :=
  g.stancePhaseDuration > 0 ∧ g.swingPhaseDuration > 0 ∧
  g.stepLength > 0 ∧ g.cadence > 0

theorem gait_cycle_valid (g : GaitCycle) : GaitCycleClosed g := by
  constructor <;> positivity

end BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean
end HautevilleHouse