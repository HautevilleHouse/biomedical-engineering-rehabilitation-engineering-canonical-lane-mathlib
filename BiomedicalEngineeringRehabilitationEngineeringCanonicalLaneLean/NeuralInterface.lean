import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean

structure NeuralInterfacePackage where
  electrodeArray : Type u
  neuralSpikeFeatures : Type v
  decodingAlgorithm : Type w
  spikeSortingAccurate : Prop
  decodingAccuracyProved : Prop
  stimulationSafetyValid : Prop

structure NeuralInterfaceEvidence (N : NeuralInterfacePackage) where
  spikeSortingAccurateClosed : N.spikeSortingAccurate
  decodingAccuracyProvedClosed : N.decodingAccuracyProved
  stimulationSafetyValidClosed : N.stimulationSafetyValid

def NeuralInterfaceClosed (N : NeuralInterfacePackage) : Prop :=
  N.spikeSortingAccurate ∧ N.decodingAccuracyProved ∧ N.stimulationSafetyValid

theorem neural_interface_closed_from_evidence (N : NeuralInterfacePackage)
    (E : NeuralInterfaceEvidence N) : NeuralInterfaceClosed N := by
  exact And.intro E.spikeSortingAccurateClosed
    (And.intro E.decodingAccuracyProvedClosed E.stimulationSafetyValidClosed)

end BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean
end HautevilleHouse