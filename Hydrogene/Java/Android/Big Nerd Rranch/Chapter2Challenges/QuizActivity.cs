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
		private ImageButton mPreviousButton;
		private ImageButton mNextButton;
		private TextView mQuestionTextView;
		private int mCurrentIndex = 0;

		private TrueFalse[] mQuestionBank = new TrueFalse[] {
			new TrueFalse (R.@string.question_oceans, true),
			new TrueFalse (R.@string.question_mideast, false),
			new TrueFalse (R.@string.question_africa, false),
			new TrueFalse (R.@string.question_americas, true),
			new TrueFalse (R.@string.question_asia, true)
		};

		// Controller Method
		private void updateQuestion() {
			int question = mQuestionBank[mCurrentIndex].getQuestion();
			mQuestionTextView.setText(question);
		}
		
		// Controller Method
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

		// View Method
		public void trueButtonClick (View v) {
			checkAnswer(true);
		}

		// View Method
		public void falseButtonClick (View v) {
			checkAnswer(false);
		}

		// View Method
		public void previousButtonClick (View v) {
			mCurrentIndex = mCurrentIndex > 0 ? (mCurrentIndex - 1) % mQuestionBank.length : mQuestionBank.length - 1;
			updateQuestion();
		}

		// View Method
		public void nextButtonClick (View v) {
			mCurrentIndex = (mCurrentIndex + 1) % mQuestionBank.length;
			updateQuestion();
		}

		// Model Method
		public override void onCreate(Bundle savedInstanceState)
		{
			base.onCreate(savedInstanceState);

			// Set our view from the "main" layout resource
			ContentView = R.layout.main;

			mQuestionTextView = (TextView)findViewById(R.id.question_text_view);
			mQuestionTextView.OnClickListener = nextButtonClick;
			updateQuestion();

			mTrueButton = (Button)findViewById(R.id.true_button);
			mTrueButton.OnClickListener = trueButtonClick;

			mFalseButton = (Button)findViewById(R.id.false_button);
			mFalseButton.OnClickListener = falseButtonClick;

			mPreviousButton = (ImageButton)findViewById(R.id.previous_button);
			mPreviousButton.OnClickListener = previousButtonClick;

			mNextButton = (ImageButton)findViewById(R.id.next_button);
			mNextButton.OnClickListener = nextButtonClick;
		}
	}
}
