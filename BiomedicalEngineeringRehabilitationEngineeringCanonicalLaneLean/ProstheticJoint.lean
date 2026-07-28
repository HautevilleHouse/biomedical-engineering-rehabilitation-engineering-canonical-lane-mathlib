import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean

structure ProstheticJoint where
  jointType : String
  rangeOfMotion : Float
  torqueRating : Float
  mass : Float

structure ProstheticJointEvidence (j : ProstheticJoint) where
  rangeWithinLimitsClosed : j.rangeOfMotion > 0 ∧ j.rangeOfMotion ≤ 180
  torqueRatingSufficientClosed : j.torqueRating > 50
  massAcceptableClosed : j.mass < 5.0

def ProstheticJointClosed (j : ProstheticJoint) : Prop :=
  (j.rangeOfMotion > 0 ∧ j.rangeOfMotion ≤ 180) ∧ j.torqueRating > 50 ∧ j.mass < 5.0

theorem prosthetic_joint_closed_from_evidence (j : ProstheticJoint) (ev : ProstheticJointEvidence j) :
    ProstheticJointClosed j := by
  exact And.intro ev.rangeWithinLimitsClosed
    (And.intro ev.torqueRatingSufficientClosed ev.massAcceptableClosed)

end BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean
end HautevilleHouse