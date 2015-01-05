using java.util;
using android.app;
using android.content;
using android.os;
using android.util;
using android.view;
using android.widget;

namespace net.nelsonsonline.geoquiz
{
	public class QuizActivity: Activity
	{
        private Button mTrueButton;
        private Button mFalseButton;
		private Button mNextButton;
		private TextView mQuestionTextView;
		private int mCurrentIndex = 0;

		private TrueFalse[] mQuestionBank = new TrueFalse[] {
			new TrueFalse (R.@string.question_oceans, true),
			new TrueFalse (R.@string.question_mideast, false),
			new TrueFalse (R.@string.question_africa, false),
			new TrueFalse (R.@string.question_americas, true),
			new TrueFalse (R.@string.question_asia, true)
		};

		private void updateQuestion() {
			int question = mQuestionBank[mCurrentIndex].getQuestion();
			mQuestionTextView.setText(question);
		}

		private void checkAnswer(Boolean userPressedTrue) {
			Boolean answerIsTrue = mQuestionBank[mCurrentIndex].isTrueQuestion();
			int messageResId = 0;

			if (userPressedTrue == answerIsTrue) {
				messageResId = R.@string.correct_toast;
			} else {
				messageResId = R.@string.incorrect_toast;
			}

			Toast.makeText(this, messageResId, Toast.LENGTH_SHORT).show();
		}

		public void trueButtonClick (View v) {
			checkAnswer(true);
		}

		public void falseButtonClick (View v) {
			checkAnswer(false);
		}

		public void nextButtonClick (View v) {
			mCurrentIndex = (mCurrentIndex + 1) % mQuestionBank.length;
			updateQuestion();
		}

		public override void onCreate(Bundle savedInstanceState)
		{
			base.onCreate(savedInstanceState);

			// Set our view from the "main" layout resource
			ContentView = R.layout.main;

			mQuestionTextView = (TextView)findViewById(R.id.question_text_view);
			updateQuestion();

			mTrueButton = (Button)findViewById(R.id.true_button);
			mTrueButton.OnClickListener = trueButtonClick;

			mFalseButton = (Button)findViewById(R.id.false_button);
			mFalseButton.OnClickListener = falseButtonClick;

			mNextButton = (Button)findViewById(R.id.next_button);
			mNextButton.OnClickListener = nextButtonClick;
		}
	}
}
