import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean

structure BiomechanicalModelPackage where
  jointAngles : Type u
  muscleForces : Type v
  groundReactionForces : Type w
  inverseDynamicsSolved : Prop
  forwardDynamicsSimulated : Prop
  parameterIdentificationDone : Prop

structure BiomechanicalModelEvidence (B : BiomechanicalModelPackage) where
  inverseDynamicsSolvedClosed : B.inverseDynamicsSolved
  forwardDynamicsSimulatedClosed : B.forwardDynamicsSimulated
  parameterIdentificationDoneClosed : B.parameterIdentificationDone

def BiomechanicalModelClosed (B : BiomechanicalModelPackage) : Prop :=
  B.inverseDynamicsSolved ∧ B.forwardDynamicsSimulated ∧ B.parameterIdentificationDone

theorem biomechanical_model_closed_from_evidence (B : BiomechanicalModelPackage)
    (E : BiomechanicalModelEvidence B) : BiomechanicalModelClosed B := by
  exact And.intro E.inverseDynamicsSolvedClosed
    (And.intro E.forwardDynamicsSimulatedClosed E.parameterIdentificationDoneClosed)

end BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean
end HautevilleHouse