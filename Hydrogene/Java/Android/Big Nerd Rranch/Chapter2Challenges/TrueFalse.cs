namespace net.nelsonsonline.geoquiz
{
	public class TrueFalse
	{
		private int mQuestion;
		private Boolean mTrueQuestion;

		public TrueFalse (int question, Boolean trueQuestion)
		{
			mQuestion = question;
			mTrueQuestion = trueQuestion;
		}

		public int getQuestion() {
			return mQuestion;
		}

		public void setQuestion(int question)
		{
			mQuestion = question;
		}

		public Boolean isTrueQuestion()
		{
			return mTrueQuestion;
		}

		public void setTrueQuestion(Boolean trueQuestion)
		{
			mTrueQuestion = trueQuestion;
		}
	}
}