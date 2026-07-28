import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean

structure EMGSignal where
  channelData : List Float
  samplingRate : Float
  filtered : Bool
  featureVector : List Float

structure EMGClassifier where
  modelWeights : List Float
  thresholds : List Float
  classLabels : List String

structure EMGControlFeedback where
  signal : EMGSignal
  classifier : EMGClassifier
  predictedMotion : String
  confidence : Float

structure EMGControlEvidence (e : EMGControlFeedback) where
  signalFilteredClosed : e.signal.filtered = true
  featureExtractedClosed : e.signal.featureVector.length > 0
  classificationWithinThresholdClosed : e.confidence > 0.8

def EMGControlClosed (e : EMGControlFeedback) : Prop :=
  e.signal.filtered ∧ e.signal.featureVector.length > 0 ∧ e.confidence > 0.8

theorem emg_control_closed_from_evidence (e : EMGControlFeedback) (ev : EMGControlEvidence e) :
    EMGControlClosed e := by
  exact And.intro ev.signalFilteredClosed
    (And.intro ev.featureExtractedClosed ev.classificationWithinThresholdClosed)

end BiomedicalEngineeringRehabilitationEngineeringCanonicalLaneLean
end HautevilleHouse