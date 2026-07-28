import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean

structure AssistiveDevicePackage where
  deviceMechanics : Type u
  controlInterface : Type v
  userTrainingProtocol : Type w
  mechanicalSafetyValid : Prop
  usabilityValid : Prop
  trainingEfficacyProved : Prop

structure AssistiveDeviceEvidence (A : AssistiveDevicePackage) where
  mechanicalSafetyValidClosed : A.mechanicalSafetyValid
  usabilityValidClosed : A.usabilityValid
  trainingEfficacyProvedClosed : A.trainingEfficacyProved

def AssistiveDeviceClosed (A : AssistiveDevicePackage) : Prop :=
  A.mechanicalSafetyValid ∧ A.usabilityValid ∧ A.trainingEfficacyProved

theorem assistive_device_closed_from_evidence (A : AssistiveDevicePackage)
    (E : AssistiveDeviceEvidence A) : AssistiveDeviceClosed A := by
  exact And.intro E.mechanicalSafetyValidClosed
    (And.intro E.usabilityValidClosed E.trainingEfficacyProvedClosed)

end BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean
end HautevilleHouse