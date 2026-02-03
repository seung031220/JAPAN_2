const { Resend } = require('resend');

const resend = new Resend(process.env.RESEND_API_KEY);

const MY_EMAIL = 'seung031220@naver.com';

module.exports = async (req, res) => {
  if (req.method !== 'POST') {
    res.status(405).json({ ok: false, error: 'Method not allowed' });
    return;
  }

  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    res.status(200).end();
    return;
  }

  const body = typeof req.body === 'string' ? (() => { try { return JSON.parse(req.body); } catch { return {}; } })() : (req.body || {});
  const { name, phone, email } = body;

  if (!name || !phone || !email) {
    res.status(400).json({ ok: false, error: '이름, 전화번호, 이메일을 모두 입력해 주세요.' });
    return;
  }

  if (!process.env.RESEND_API_KEY) {
    console.error('RESEND_API_KEY is not set');
    res.status(500).json({ ok: false, error: '서버 설정 오류입니다.' });
    return;
  }

  try {
    const { data, error } = await resend.emails.send({
      from: '일본어 퀴즈 <onboarding@resend.dev>',
      to: [MY_EMAIL],
      subject: '[일본어 퀴즈] 참가자 정보',
      html: `
        <h2>참가자 정보</h2>
        <p><strong>이름:</strong> ${escapeHtml(name)}</p>
        <p><strong>전화번호:</strong> ${escapeHtml(phone)}</p>
        <p><strong>이메일:</strong> ${escapeHtml(email)}</p>
      `,
    });

    if (error) {
      console.error('Resend error:', error);
      res.status(500).json({ ok: false, error: error.message || '메일 발송에 실패했습니다.' });
      return;
    }

    res.status(200).json({ ok: true, message: '제출되었습니다.' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ ok: false, error: '메일 발송 중 오류가 발생했습니다.' });
  }
};

function escapeHtml(text) {
  if (!text) return '';
  const map = { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#039;' };
  return String(text).replace(/[&<>"']/g, (c) => map[c]);
}
