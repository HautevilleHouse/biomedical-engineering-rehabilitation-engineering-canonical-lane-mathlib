import BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean.CompartmentModel

/-!
# Pharmacokinetics Package
-/

namespace HautevilleHouse
namespace BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean

structure PharmacokineticsPackage {C : CompartmentModelPackage} where
  drugAdministration : Prop
  absorptionModel : Prop
  distributionModel : Prop
  eliminationModel : Prop
  clearanceEstimate : Prop

structure PharmacokineticsEvidence {C : CompartmentModelPackage} (P : PharmacokineticsPackage C) where
  drugAdministrationClosed : P.drugAdministration
  absorptionModelClosed : P.absorptionModel
  distributionModelClosed : P.distributionModel
  eliminationModelClosed : P.eliminationModel
  clearanceEstimateClosed : P.clearanceEstimate

def PharmacokineticsClosed {C : CompartmentModelPackage} (P : PharmacokineticsPackage C) : Prop :=
  P.drugAdministration ∧ P.absorptionModel ∧ P.distributionModel ∧ P.eliminationModel ∧ P.clearanceEstimate

theorem pharmacokinetics_closed_from_evidence {C : CompartmentModelPackage} (P : PharmacokineticsPackage C) (E : PharmacokineticsEvidence P) :
    PharmacokineticsClosed P := by
  exact And.intro E.drugAdministrationClosed
    (And.intro E.absorptionModelClosed
      (And.intro E.distributionModelClosed
        (And.intro E.eliminationModelClosed E.clearanceEstimateClosed)))

end BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean
end HautevilleHouse
