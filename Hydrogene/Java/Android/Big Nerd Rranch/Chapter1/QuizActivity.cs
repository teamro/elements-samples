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

		public void trueButtonClick (View v) {
			Toast.makeText(this, R.@string.incorrect_toast, Toast.LENGTH_SHORT).show();
		}

		public void falseButtonClick (View v) {
			Toast.makeText(getApplicationContext(), R.@string.correct_toast, Toast.LENGTH_SHORT).show();
		}

		public override void onCreate(Bundle savedInstanceState)
		{
			base.onCreate(savedInstanceState);

			// Set our view from the "main" layout resource
			ContentView = R.layout.main;

			mTrueButton = (Button)findViewById(R.id.true_button);
			mTrueButton.OnClickListener = trueButtonClick;
			mFalseButton = (Button)findViewById(R.id.false_button);
			mFalseButton.OnClickListener = falseButtonClick;
		}
	}
}
