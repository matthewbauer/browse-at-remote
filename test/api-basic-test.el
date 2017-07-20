
(require 'browse-at-remote)

(ert-deftest get-git-repo-url-test ()
  "Generate github repo url from various kind of origin"

  (should (equal (browse-at-remote--get-url-from-remote "ssh://git@bitbucket.org:peta/project.git")
                 (cons `"bitbucket.org" `"https://bitbucket.org/peta/project")))
  (should (equal (browse-at-remote--get-url-from-remote "git@github.com:getgoing/airborne.git")
                 (cons `"github.com" `"https://github.com/getgoing/airborne")))
  (should (equal (browse-at-remote--get-url-from-remote "git@github.com:env0der/dotemacs.git")
                 (cons `"github.com" `"https://github.com/env0der/dotemacs")))
  (should (equal (browse-at-remote--get-url-from-remote "git@bitbucket.org:some/bome.git")
                 (cons `"bitbucket.org" `"https://bitbucket.org/some/bome")))
  (should (equal (browse-at-remote--get-url-from-remote "git@github.com:someplace_with_underscores/with_underscores.el.git")
                 (cons `"github.com" `"https://github.com/someplace_with_underscores/with_underscores.el")))
  (should (equal (browse-at-remote--get-url-from-remote "git@github.com:someplace/with-dash.el.git")
                 (cons `"github.com" `"https://github.com/someplace/with-dash.el")))
  (should (equal (browse-at-remote--get-url-from-remote "git@github.com:someplace/wi2th-dash.el.git")
                 (cons `"github.com" `"https://github.com/someplace/wi2th-dash.el")))
  (should (equal (browse-at-remote--get-url-from-remote "ssh://git.example.com:8080/someplace/wi2th-dash.el")
                 (cons `"git.example.com:8080" `"https://git.example.com:8080/someplace/wi2th-dash.el")))
  )

(ert-deftest get-https-repo-url-test ()
  "Test origins having https in the beginning"

  (should (equal (browse-at-remote--get-url-from-remote "https://rmuslimov@bitbucket.org/some/bome.git")
				 (cons `"bitbucket.org" `"https://bitbucket.org/some/bome")))
  (should (equal (browse-at-remote--get-url-from-remote "https://github.com/syl20bnr/spacemacs")
				 (cons `"github.com" `"https://github.com/syl20bnr/spacemacs")))
  (should (equal (browse-at-remote--get-url-from-remote "https://github.com/rejeep/prodigy.el.git")
				 (cons `"github.com" `"https://github.com/rejeep/prodigy.el")))
  (should (equal (browse-at-remote--get-url-from-remote "https://github.com/rejeep/pro-digy.el.git")
				 (cons `"github.com" `"https://github.com/rejeep/pro-digy.el")))
  (should (equal (browse-at-remote--get-url-from-remote "https://github.com/with_underscores/pro-digy_underscores.el.git")
				 (cons `"github.com" `"https://github.com/with_underscores/pro-digy_underscores.el")))
  (should (equal (browse-at-remote--get-url-from-remote "https://github.com/rmuslimov/browse-at-remote.git")
				 (cons `"github.com" `"https://github.com/rmuslimov/browse-at-remote")))
  )

(ert-deftest get-https-repo-url-without-ending ()
  (should (equal (browse-at-remote--get-url-from-remote "https://github.com/rmuslimov/browse-at-remote")
				 (cons `"github.com" `"https://github.com/rmuslimov/browse-at-remote")))
  (should (equal (browse-at-remote--get-url-from-remote "https://github.com/rmus2limov/brows2e-at-remote")
				 (cons `"github.com" `"https://github.com/rmus2limov/brows2e-at-remote")))
  (should (equal (browse-at-remote--get-url-from-remote "git@github.com:someplace/without-ending")
                                 (cons `"github.com" `"https://github.com/someplace/without-ending")))
  )
