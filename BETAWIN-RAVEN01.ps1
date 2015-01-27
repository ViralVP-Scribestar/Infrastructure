



<!DOCTYPE html>
<html lang="en" class="">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    
    
    <title>Infrastructure/BETAWIN-RAVEN01.ps1 at 59d0a8e032a0950a68af24ba94994d6dd7f2a05f · Scribestar/Infrastructure</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="Scribestar/Infrastructure" name="twitter:title" /><meta content="Contribute to Infrastructure development by creating an account on GitHub." name="twitter:description" /><meta content="https://avatars2.githubusercontent.com/u/7109325?v=3&amp;s=400" name="twitter:image:src" />
<meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars2.githubusercontent.com/u/7109325?v=3&amp;s=400" property="og:image" /><meta content="Scribestar/Infrastructure" property="og:title" /><meta content="https://github.com/Scribestar/Infrastructure" property="og:url" /><meta content="Contribute to Infrastructure development by creating an account on GitHub." property="og:description" />

      <meta name="browser-stats-url" content="/_stats">
    <link rel="assets" href="https://assets-cdn.github.com/">
    <link rel="conduit-xhr" href="https://ghconduit.com:25035">
    <link rel="xhr-socket" href="/_sockets">
    <meta name="pjax-timeout" content="1000">
    <link rel="sudo-modal" href="/sessions/sudo_modal">

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>
      <meta name="google-analytics" content="UA-3769691-2">

    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="D50FFE92:536A:EA8A4F2:54C758C1" name="octolytics-dimension-request_id" /><meta content="8644151" name="octolytics-actor-id" /><meta content="ViralVP-Scribestar" name="octolytics-actor-login" /><meta content="495a68823a16b21f9d1f4e9d0afbceef428cbf7e7912046316d39ee434b2ab5b" name="octolytics-actor-hash" />
    <meta content="/private/private/blob/show" name="analytics-location" />
    <meta content="Rails, view, blob#show" name="analytics-event" />

    
    
    <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">


    <meta content="authenticity_token" name="csrf-param" />
<meta content="mnVaunHR0GZsGs7U61WzHPasky/R9W7U7tat14Bx5uN7W3jH85ISybPY4tVYeDIXGs+xrzM7k6SlUtDkQ740gQ==" name="csrf-token" />

    <link href="https://assets-cdn.github.com/assets/github-3459daf90471046f54cbe33e028c6d096ccf03a7142062186398001723f80d38.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://assets-cdn.github.com/assets/github2-29c7da379589a0dc8a4aeee9d661ddbbc6726ded580d170ced239d72d1137908.css" media="all" rel="stylesheet" type="text/css" />
    
    


    <meta http-equiv="x-pjax-version" content="57de0354c27ccadf5c8cce619fa0da88">

      
  <meta name="description" content="Contribute to Infrastructure development by creating an account on GitHub.">
  <meta name="go-import" content="github.com/Scribestar/Infrastructure git https://github.com/Scribestar/Infrastructure.git">

  <meta content="7109325" name="octolytics-dimension-user_id" /><meta content="Scribestar" name="octolytics-dimension-user_login" /><meta content="23596654" name="octolytics-dimension-repository_id" /><meta content="Scribestar/Infrastructure" name="octolytics-dimension-repository_nwo" /><meta content="false" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="23596654" name="octolytics-dimension-repository_network_root_id" /><meta content="Scribestar/Infrastructure" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/Scribestar/Infrastructure/commits/59d0a8e032a0950a68af24ba94994d6dd7f2a05f.atom?token=AIPmNyo5I3Q8CUelY0NW2EemdvgI5L8rks6y1ItEwA%3D%3D" rel="alternate" title="Recent Commits to Infrastructure:59d0a8e032a0950a68af24ba94994d6dd7f2a05f" type="application/atom+xml">

  </head>


  <body class="logged_in  env-production windows vis-private page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>
    <div class="wrapper">
      
      
      
      


      <div class="header header-logged-in true" role="banner">
  <div class="container clearfix">

    <a class="header-logo-invertocat" href="https://github.com/" data-hotkey="g d" aria-label="Homepage" ga-data-click="Header, go to dashboard, icon:logo">
  <span class="mega-octicon octicon-mark-github"></span>
</a>


      <div class="site-search repo-scope js-site-search" role="search">
          <form accept-charset="UTF-8" action="/Scribestar/Infrastructure/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/Scribestar/Infrastructure/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
  <input type="text"
    class="js-site-search-field is-clearable"
    data-hotkey="s"
    name="q"
    placeholder="Search"
    data-global-scope-placeholder="Search GitHub"
    data-repo-scope-placeholder="Search"
    tabindex="1"
    autocapitalize="off">
  <div class="scope-badge">This repository</div>
</form>
      </div>
      <ul class="header-nav left" role="navigation">
        <li class="header-nav-item explore">
          <a class="header-nav-link" href="/explore" data-ga-click="Header, go to explore, text:explore">Explore</a>
        </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://gist.github.com" data-ga-click="Header, go to gist, text:gist">Gist</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/blog" data-ga-click="Header, go to blog, text:blog">Blog</a>
          </li>
        <li class="header-nav-item">
          <a class="header-nav-link" href="https://help.github.com" data-ga-click="Header, go to help, text:help">Help</a>
        </li>
      </ul>

    
<ul class="header-nav user-nav right" id="user-links">
  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link name" href="/ViralVP-Scribestar" data-ga-click="Header, go to profile, text:username">
      <img alt="ViralVP-Scribestar" class="avatar" data-user="8644151" height="20" src="https://avatars0.githubusercontent.com/u/8644151?v=3&amp;s=40" width="20" />
      <span class="css-truncate">
        <span class="css-truncate-target">ViralVP-Scribestar</span>
      </span>
    </a>
  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link js-menu-target tooltipped tooltipped-s" href="#" aria-label="Create new..." data-ga-click="Header, create new, icon:add">
      <span class="octicon octicon-plus"></span>
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      
<ul class="dropdown-menu">
  <li>
    <a href="/new" data-ga-click="Header, create new repository, icon:repo"><span class="octicon octicon-repo"></span> New repository</a>
  </li>
  <li>
    <a href="/organizations/new" data-ga-click="Header, create new organization, icon:organization"><span class="octicon octicon-organization"></span> New organization</a>
  </li>
    <li class="dropdown-divider"></li>
    <li class="dropdown-header">
      <span title="Scribestar">This organization</span>
    </li>

    <li>
      <a href="/orgs/Scribestar/invitations/new" data-ga-click="Header, invite someone, icon:person"><span class="octicon octicon-person"></span> Invite someone</a>
    </li>

    <li>
      <a href="/orgs/Scribestar/new-team" data-ga-click="Header, create new team, icon:jersey"><span class="octicon octicon-jersey"></span> New team</a>
    </li>

    <li>
      <a href="/organizations/Scribestar/repositories/new" data-ga-click="Header, create new organization repository, icon:repo"><span class="octicon octicon-repo"></span> New repository</a>
    </li>


    <li class="dropdown-divider"></li>
    <li class="dropdown-header">
      <span title="Scribestar/Infrastructure">This repository</span>
    </li>
      <li>
        <a href="/Scribestar/Infrastructure/issues/new" data-ga-click="Header, create new issue, icon:issue"><span class="octicon octicon-issue-opened"></span> New issue</a>
      </li>
      <li>
        <a href="/Scribestar/Infrastructure/settings/collaboration" data-ga-click="Header, create new collaborator, icon:person"><span class="octicon octicon-person"></span> New collaborator</a>
      </li>
</ul>

    </div>
  </li>

  <li class="header-nav-item">
        <a href="/notifications" aria-label="You have no unread notifications" class="header-nav-link notification-indicator tooltipped tooltipped-s" data-ga-click="Header, go to notifications, icon:read" data-hotkey="g n">
        <span class="mail-status all-read"></span>
        <span class="octicon octicon-inbox"></span>
</a>
  </li>

  <li class="header-nav-item">
    <a class="header-nav-link tooltipped tooltipped-s" href="/settings/profile" id="account_settings" aria-label="Settings" data-ga-click="Header, go to settings, icon:settings">
      <span class="octicon octicon-gear"></span>
    </a>
  </li>

  <li class="header-nav-item">
    <form accept-charset="UTF-8" action="/logout" class="logout-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="lCFsLN89r5C2weZeAYC0R5A8iFNrtNgqLRK7Dp1+ZZRuZod4VxncdO9MVdIcH23qkhHAmoxY9uxEr0Vuz2678w==" /></div>
      <button class="header-nav-link sign-out-button tooltipped tooltipped-s" aria-label="Sign out" data-ga-click="Header, sign out, icon:logout">
        <span class="octicon octicon-sign-out"></span>
      </button>
</form>  </li>

</ul>


    
  </div>
</div>

      

        


      <div id="start-of-content" class="accessibility-aid"></div>
          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    <div id="js-flash-container">
      
    </div>
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        
<ul class="pagehead-actions">

    <li class="subscription">
      <form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="rGZA8AeGq/sKIia5o3vFacj4pb8F/jyzqaKn/jXmwJ8oUrE7QKZ/EsM0n3lpbHCSdZrO0kPs9bU3IDW2sOw+ag==" /></div>  <input id="repository_id" name="repository_id" type="hidden" value="23596654" />

    <div class="select-menu js-menu-container js-select-menu">
      <a class="social-count js-social-count" href="/Scribestar/Infrastructure/watchers">
        12
      </a>
      <a href="/Scribestar/Infrastructure/subscription"
        class="minibutton select-menu-button with-count js-menu-target" role="button" tabindex="0" aria-haspopup="true">
        <span class="js-select-button">
          <span class="octicon octicon-eye"></span>
          Watch
        </span>
      </a>

      <div class="select-menu-modal-holder">
        <div class="select-menu-modal subscription-menu-modal js-menu-content" aria-hidden="true">
          <div class="select-menu-header">
            <span class="select-menu-title">Notifications</span>
            <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
          </div> <!-- /.select-menu-header -->

          <div class="select-menu-list js-navigation-container" role="menu">

            <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input checked="checked" id="do_included" name="do" type="radio" value="included" />
                <h4>Not watching</h4>
                <span class="description">Be notified when participating or @mentioned.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye"></span>
                  Watch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_subscribed" name="do" type="radio" value="subscribed" />
                <h4>Watching</h4>
                <span class="description">Be notified of all conversations.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye"></span>
                  Unwatch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_ignore" name="do" type="radio" value="ignore" />
                <h4>Ignoring</h4>
                <span class="description">Never be notified.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-mute"></span>
                  Stop ignoring
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

          </div> <!-- /.select-menu-list -->

        </div> <!-- /.select-menu-modal -->
      </div> <!-- /.select-menu-modal-holder -->
    </div> <!-- /.select-menu -->

</form>
    </li>

  <li>
    
  <div class="js-toggler-container js-social-container starring-container ">

    <form accept-charset="UTF-8" action="/Scribestar/Infrastructure/unstar" class="js-toggler-form starred js-unstar-button" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="ih2MTRiTwkzGewnhVTddxe+I+jWaQLokmS7shJ0hIY3HyULXTQ3glacCMJfOF6nmhAkepvm9eUJpxKwJlAriwg==" /></div>
      <button
        class="minibutton with-count js-toggler-target star-button"
        aria-label="Unstar this repository" title="Unstar Scribestar/Infrastructure">
        <span class="octicon octicon-star"></span>
        Unstar
      </button>
        <a class="social-count js-social-count" href="/Scribestar/Infrastructure/stargazers">
          0
        </a>
</form>
    <form accept-charset="UTF-8" action="/Scribestar/Infrastructure/star" class="js-toggler-form unstarred js-star-button" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="ir6/OE/6JOj4oy9g1lIb400xea1+ngFZP0BrAglv0nlK3ZaAIRR1SJhmB2pbNli1G8Uzo+fCF/YlL8mm6/p9ZA==" /></div>
      <button
        class="minibutton with-count js-toggler-target star-button"
        aria-label="Star this repository" title="Star Scribestar/Infrastructure">
        <span class="octicon octicon-star"></span>
        Star
      </button>
        <a class="social-count js-social-count" href="/Scribestar/Infrastructure/stargazers">
          0
        </a>
</form>  </div>

  </li>


        <li>
          <a href="/Scribestar/Infrastructure/fork" class="minibutton with-count js-toggler-target fork-button tooltipped-n" title="Fork your own copy of Scribestar/Infrastructure to your account" aria-label="Fork your own copy of Scribestar/Infrastructure to your account" rel="facebox nofollow">
            <span class="octicon octicon-repo-forked"></span>
            Fork
          </a>
          <a href="/Scribestar/Infrastructure/network" class="social-count">0</a>
        </li>

</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title private">
          <span class="mega-octicon octicon-lock"></span>
          <span class="author"><a href="/Scribestar" class="url fn" itemprop="url" rel="author"><span itemprop="title">Scribestar</span></a></span><!--
       --><span class="path-divider">/</span><!--
       --><strong><a href="/Scribestar/Infrastructure" class="js-current-repository" data-pjax="#js-repo-pjax-container">Infrastructure</a></strong>
            <span class="repo-private-label">private</span>

          <span class="page-context-loader">
            <img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline  ">
        <div class="repository-sidebar clearfix">
            
<nav class="sunken-menu repo-nav js-repo-nav js-sidenav-container-pjax js-octicon-loaders"
     role="navigation"
     data-pjax="#js-repo-pjax-container"
     data-issue-count-url="/Scribestar/Infrastructure/issues/counts">
  <ul class="sunken-menu-group">
    <li class="tooltipped tooltipped-w" aria-label="Code">
      <a href="/Scribestar/Infrastructure" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /Scribestar/Infrastructure">
        <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Issues">
        <a href="/Scribestar/Infrastructure/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /Scribestar/Infrastructure/issues">
          <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
          <span class="js-issue-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

    <li class="tooltipped tooltipped-w" aria-label="Pull Requests">
      <a href="/Scribestar/Infrastructure/pulls" aria-label="Pull Requests" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g p" data-selected-links="repo_pulls /Scribestar/Infrastructure/pulls">
          <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
          <span class="js-pull-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>


      <li class="tooltipped tooltipped-w" aria-label="Wiki">
        <a href="/Scribestar/Infrastructure/wiki" aria-label="Wiki" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g w" data-selected-links="repo_wiki /Scribestar/Infrastructure/wiki">
          <span class="octicon octicon-book"></span> <span class="full-word">Wiki</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
  </ul>
  <div class="sunken-menu-separator"></div>
  <ul class="sunken-menu-group">

    <li class="tooltipped tooltipped-w" aria-label="Pulse">
      <a href="/Scribestar/Infrastructure/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-selected-links="pulse /Scribestar/Infrastructure/pulse">
        <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

    <li class="tooltipped tooltipped-w" aria-label="Graphs">
      <a href="/Scribestar/Infrastructure/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_graphs repo_contributors /Scribestar/Infrastructure/graphs">
        <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>
  </ul>


    <div class="sunken-menu-separator"></div>
    <ul class="sunken-menu-group">
      <li class="tooltipped tooltipped-w" aria-label="Settings">
        <a href="/Scribestar/Infrastructure/settings" aria-label="Settings" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_settings /Scribestar/Infrastructure/settings">
          <span class="octicon octicon-tools"></span> <span class="full-word">Settings</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
    </ul>
</nav>

              <div class="only-with-full-nav">
                
  
<div class="clone-url "
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><span class="text-emphasized">HTTPS</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/Scribestar/Infrastructure.git" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="clone-url open"
  data-protocol-type="ssh"
  data-url="/users/set_protocol?protocol_selector=ssh&amp;protocol_type=clone">
  <h3><span class="text-emphasized">SSH</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="git@github.com:Scribestar/Infrastructure.git" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><span class="text-emphasized">Subversion</span> checkout URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/Scribestar/Infrastructure" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>



<p class="clone-options">You can clone with
  <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>, <a href="#" class="js-clone-selector" data-protocol="ssh">SSH</a>, or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <a href="https://help.github.com/articles/which-remote-url-should-i-use" class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <span class="octicon octicon-question"></span>
  </a>
</p>


  <a href="github-windows://openRepo/https://github.com/Scribestar/Infrastructure" class="minibutton sidebar-button" title="Save Scribestar/Infrastructure to your computer and use it in GitHub Desktop." aria-label="Save Scribestar/Infrastructure to your computer and use it in GitHub Desktop.">
    <span class="octicon octicon-device-desktop"></span>
    Clone in Desktop
  </a>

                <a href="/Scribestar/Infrastructure/archive/59d0a8e032a0950a68af24ba94994d6dd7f2a05f.zip"
                   class="minibutton sidebar-button"
                   aria-label="Download the contents of Scribestar/Infrastructure as a zip file"
                   title="Download the contents of Scribestar/Infrastructure as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          

<a href="/Scribestar/Infrastructure/blob/59d0a8e032a0950a68af24ba94994d6dd7f2a05f/Viral/BETAVMCreation/BETAWIN-RAVEN01.ps1" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:7b20fcd3a5c0d52d09cd00e44d79cfab -->

<div class="file-navigation js-zeroclipboard-container">
  
<div class="select-menu js-menu-container js-select-menu left">
  <span class="minibutton select-menu-button js-menu-target css-truncate" data-hotkey="w"
    data-master-branch="master"
    data-ref=""
    title=""
    role="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <span class="octicon octicon-git-branch"></span>
    <i>tree:</i>
    <span class="js-select-button css-truncate-target">59d0a8e032</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Find or create a branch…" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Find or create a branch…">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/Scribestar/Infrastructure/blob/master/Viral/BETAVMCreation/BETAWIN-RAVEN01.ps1"
                 data-name="master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="master">master</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <form accept-charset="UTF-8" action="/Scribestar/Infrastructure/branches" class="js-create-branch select-menu-item select-menu-new-item-form js-navigation-item js-new-item-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="V46Ux5wVvQ6m6wHHXBquzS/WNSpvVtsYNsqX5vx/N2OvVdZgeeImSs5V1bCI9tV8GMi08ZExQ7WmdPJxGcKkJA==" /></div>
            <span class="octicon octicon-git-branch select-menu-item-icon"></span>
            <div class="select-menu-item-text">
              <h4>Create branch: <span class="js-new-item-name"></span></h4>
              <span class="description">from ‘59d0a8e’</span>
            </div>
            <input type="hidden" name="name" id="name" class="js-new-item-value">
            <input type="hidden" name="branch" id="branch" value="59d0a8e032a0950a68af24ba94994d6dd7f2a05f">
            <input type="hidden" name="path" id="path" value="Viral/BETAVMCreation/BETAWIN-RAVEN01.ps1">
          </form> <!-- /.select-menu-item -->

      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="button-group right">
    <a href="/Scribestar/Infrastructure/find/59d0a8e032a0950a68af24ba94994d6dd7f2a05f"
          class="js-show-file-finder minibutton empty-icon tooltipped tooltipped-s"
          data-pjax
          data-hotkey="t"
          aria-label="Quickly jump between files">
      <span class="octicon octicon-list-unordered"></span>
    </a>
    <button aria-label="Copy file path to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
  </div>

  <div class="breadcrumb js-zeroclipboard-target">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/Scribestar/Infrastructure/tree/59d0a8e032a0950a68af24ba94994d6dd7f2a05f" class="" data-branch="59d0a8e032a0950a68af24ba94994d6dd7f2a05f" data-direction="back" data-pjax="true" itemscope="url" rel="nofollow"><span itemprop="title">Infrastructure</span></a></span></span><span class="separator">/</span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/Scribestar/Infrastructure/tree/59d0a8e032a0950a68af24ba94994d6dd7f2a05f/Viral" class="" data-branch="59d0a8e032a0950a68af24ba94994d6dd7f2a05f" data-direction="back" data-pjax="true" itemscope="url" rel="nofollow"><span itemprop="title">Viral</span></a></span><span class="separator">/</span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/Scribestar/Infrastructure/tree/59d0a8e032a0950a68af24ba94994d6dd7f2a05f/Viral/BETAVMCreation" class="" data-branch="59d0a8e032a0950a68af24ba94994d6dd7f2a05f" data-direction="back" data-pjax="true" itemscope="url" rel="nofollow"><span itemprop="title">BETAVMCreation</span></a></span><span class="separator">/</span><strong class="final-path">BETAWIN-RAVEN01.ps1</strong>
  </div>
</div>

<include-fragment class="commit commit-loader file-history-tease" src="/Scribestar/Infrastructure/contributors/59d0a8e032a0950a68af24ba94994d6dd7f2a05f/Viral/BETAVMCreation/BETAWIN-RAVEN01.ps1">
  <div class="file-history-tease-header">
    Fetching contributors&hellip;
  </div>

  <div class="participation">
    <p class="loader-loading"><img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32-EAF2F5.gif" width="16" /></p>
    <p class="loader-error">Cannot retrieve contributors at this time</p>
  </div>
</include-fragment>
<div class="file-box">
  <div class="file">
    <div class="meta clearfix">
      <div class="info file-name">
          <span>210 lines (153 sloc)</span>
          <span class="meta-divider"></span>
        <span>9.654 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
          <a href="/Scribestar/Infrastructure/raw/59d0a8e032a0950a68af24ba94994d6dd7f2a05f/Viral/BETAVMCreation/BETAWIN-RAVEN01.ps1" class="minibutton " id="raw-url">Raw</a>
            <a href="/Scribestar/Infrastructure/blame/59d0a8e032a0950a68af24ba94994d6dd7f2a05f/Viral/BETAVMCreation/BETAWIN-RAVEN01.ps1" class="minibutton js-update-url-with-hash">Blame</a>
          <a href="/Scribestar/Infrastructure/commits/59d0a8e032a0950a68af24ba94994d6dd7f2a05f/Viral/BETAVMCreation/BETAWIN-RAVEN01.ps1" class="minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->


            <a class="octicon-button disabled tooltipped tooltipped-w" href="#"
               aria-label="You must be on a branch to make or propose changes to this file"><span class="octicon octicon-pencil"></span></a>

          <a class="octicon-button danger disabled tooltipped tooltipped-w" href="#"
             aria-label="You must be on a branch to make or propose changes to this file">
          <span class="octicon octicon-trashcan"></span>
        </a>
      </div><!-- /.actions -->
    </div>
    

  <div class="blob-wrapper data type-powershell">
      <table class="highlight tab-size-8 js-file-line-container">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code js-file-line">﻿<span class="pl-k"><span class="pl-k">Connect-VIServer</span></span> <span class="pl-k">-</span>Server <span class="pl-k"><span class="pl-k">VCS-PROD</span></span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code js-file-line"><span class="pl-vo">$smtpserver</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>smtp-relay.gmail.com<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code js-file-line"><span class="pl-vo">$ErrorActionPreference</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>stop<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code js-file-line"><span class="pl-vo">$EmailTo</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>Scribestar-Infrastructure@scribestar.com<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code js-file-line"><span class="pl-c">##Directory Creation</span></td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code js-file-line"><span class="pl-vo">$MyDateTime</span> <span class="pl-k">=</span> <span class="pl-k"><span class="pl-k">Get-Date</span></span> <span class="pl-k">-</span>UFormat <span class="pl-k">%</span>Y:<span class="pl-k">%</span>m:<span class="pl-k">%</span>d:<span class="pl-k">%</span>H:<span class="pl-k">%</span>M:<span class="pl-k">%</span>S</td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code js-file-line"><span class="pl-vo">$year</span> <span class="pl-k">=</span> <span class="pl-vo">$MyDateTime</span>.Split(<span class="pl-s1"><span class="pl-pds">&quot;</span>:<span class="pl-pds">&quot;</span></span>)[<span class="pl-c1">0</span>];<span class="pl-vo">$month</span> <span class="pl-k">=</span> <span class="pl-vo">$MyDateTime</span>.Split(<span class="pl-s1"><span class="pl-pds">&quot;</span>:<span class="pl-pds">&quot;</span></span>)[<span class="pl-c1">1</span>];<span class="pl-vo">$day</span> <span class="pl-k">=</span> <span class="pl-vo">$MyDateTime</span>.Split(<span class="pl-s1"><span class="pl-pds">&quot;</span>:<span class="pl-pds">&quot;</span></span>)[<span class="pl-c1">2</span>]</td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code js-file-line"><span class="pl-vo">$hour</span> <span class="pl-k">=</span> <span class="pl-vo">$MyDateTime</span>.Split(<span class="pl-s1"><span class="pl-pds">&quot;</span>:<span class="pl-pds">&quot;</span></span>)[<span class="pl-c1">3</span>];<span class="pl-vo">$minute</span> <span class="pl-k">=</span> <span class="pl-vo">$MyDateTime</span>.Split(<span class="pl-s1"><span class="pl-pds">&quot;</span>:<span class="pl-pds">&quot;</span></span>)[<span class="pl-c1">4</span>];<span class="pl-vo">$sec</span> <span class="pl-k">=</span> <span class="pl-vo">$MyDateTime</span>.Split(<span class="pl-s1"><span class="pl-pds">&quot;</span>:<span class="pl-pds">&quot;</span></span>)[<span class="pl-c1">5</span>]</td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code js-file-line"><span class="pl-vo">$startDateTime</span> <span class="pl-k">=</span> <span class="pl-k"><span class="pl-k">Get-Date</span></span></td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code js-file-line"><span class="pl-c">#Log Location</span></td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code js-file-line"><span class="pl-vo">$newvmfaillogs</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\VMCreation\NewVMErrorLogs\$year\$month\$day\<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code js-file-line"><span class="pl-vo">$workingpath1</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>$newvmfaillogs\NewVMError-$hour.$minute.$sec.log<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-k">-not</span>(<span class="pl-k"><span class="pl-k">Test-Path</span></span> <span class="pl-vo">$newvmfaillogs</span>)) {<span class="pl-k"><span class="pl-k">md</span></span> <span class="pl-vo">$newvmfaillogs</span>}</td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code js-file-line"><span class="pl-vo">$neworklabelfail</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\NetworkLabelErrorLogs\$year\$month\$day\<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code js-file-line"><span class="pl-vo">$workingpath2</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>$neworklabelfail\NetworkLabelFail-$hour.$minute.$sec.log<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-k">-not</span>(<span class="pl-k"><span class="pl-k">Test-Path</span></span> <span class="pl-vo">$neworklabelfail</span>)){<span class="pl-k"><span class="pl-k">md</span></span> <span class="pl-vo">$neworklabelfail</span>}</td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code js-file-line"><span class="pl-vo">$networkinterface</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\NetworkInterfaceErrorLogs\$year\$month\$day\<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code js-file-line"><span class="pl-vo">$workingpath3</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>$networkinterface\NetworkinterfaceError-$hour.$minute.$sec.log<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L21" class="blob-num js-line-number" data-line-number="21"></td>
        <td id="LC21" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-k">-not</span>(<span class="pl-k"><span class="pl-k">Test-Path</span></span> <span class="pl-vo">$networkinterface</span>)) {<span class="pl-k"><span class="pl-k">md</span></span> <span class="pl-vo">$networkinterface</span>}</td>
      </tr>
      <tr>
        <td id="L22" class="blob-num js-line-number" data-line-number="22"></td>
        <td id="LC22" class="blob-code js-file-line"><span class="pl-vo">$startvmerrorlogs</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\StartVMErrorLogs\$year\$month\$day\<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L23" class="blob-num js-line-number" data-line-number="23"></td>
        <td id="LC23" class="blob-code js-file-line"><span class="pl-vo">$workingpath4</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>$startvmerrorlogs\StartVMError-$hour.$minute.$sec.log<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L24" class="blob-num js-line-number" data-line-number="24"></td>
        <td id="LC24" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-k">-not</span>(<span class="pl-k"><span class="pl-k">Test-Path</span></span> <span class="pl-vo">$startvmerrorlogs</span>)) {<span class="pl-k"><span class="pl-k">md</span></span> <span class="pl-vo">$startvmerrorlogs</span>}</td>
      </tr>
      <tr>
        <td id="L25" class="blob-num js-line-number" data-line-number="25"></td>
        <td id="LC25" class="blob-code js-file-line"><span class="pl-vo">$newvmharddiskerrorlogs</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>\\nas.scribestar.internal\Shared Resource\Infrastructure\VMware\NewVMHardDiskErrorLogs\$year\$month\$day\<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L26" class="blob-num js-line-number" data-line-number="26"></td>
        <td id="LC26" class="blob-code js-file-line"><span class="pl-vo">$workingpath5</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>$newvmharddiskerrorlogs\NewHardDiskError-$hour.$minute.$sec.log<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L27" class="blob-num js-line-number" data-line-number="27"></td>
        <td id="LC27" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-k">-not</span>(<span class="pl-k"><span class="pl-k">Test-Path</span></span> <span class="pl-vo">$newvmharddiskerrorlogs</span>)) {<span class="pl-k"><span class="pl-k">md</span></span> <span class="pl-vo">$newvmharddiskerrorlogs</span>}</td>
      </tr>
      <tr>
        <td id="L28" class="blob-num js-line-number" data-line-number="28"></td>
        <td id="LC28" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L29" class="blob-num js-line-number" data-line-number="29"></td>
        <td id="LC29" class="blob-code js-file-line"><span class="pl-c">#Creating VM</span></td>
      </tr>
      <tr>
        <td id="L30" class="blob-num js-line-number" data-line-number="30"></td>
        <td id="LC30" class="blob-code js-file-line">Function <span class="pl-k"><span class="pl-k">New-ScribestarVM</span></span> {</td>
      </tr>
      <tr>
        <td id="L31" class="blob-num js-line-number" data-line-number="31"></td>
        <td id="LC31" class="blob-code js-file-line"><span class="pl-k">param</span>([string]<span class="pl-vo">$Name</span><span class="pl-k">=</span><span class="pl-vo">$null</span>,[string]<span class="pl-vo">$Datastore</span><span class="pl-k">=</span><span class="pl-vo">$null</span>,[string]<span class="pl-vo">$Template</span><span class="pl-k">=</span><span class="pl-vo">$null</span>,[string]<span class="pl-vo">$Location</span><span class="pl-k">=</span><span class="pl-vo">$null</span>,[string]<span class="pl-vo">$ResourcePool</span><span class="pl-k">=</span><span class="pl-vo">$null</span>)</td>
      </tr>
      <tr>
        <td id="L32" class="blob-num js-line-number" data-line-number="32"></td>
        <td id="LC32" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-k">-not</span>(<span class="pl-vo">$Name</span>)){<span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>No Name Provided<span class="pl-pds">&quot;</span></span>;<span class="pl-k">break</span>}</td>
      </tr>
      <tr>
        <td id="L33" class="blob-num js-line-number" data-line-number="33"></td>
        <td id="LC33" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-k">-not</span>(<span class="pl-vo">$Datastore</span>)){<span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>No Datastore Provided<span class="pl-pds">&quot;</span></span>;<span class="pl-k">break</span>}</td>
      </tr>
      <tr>
        <td id="L34" class="blob-num js-line-number" data-line-number="34"></td>
        <td id="LC34" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-k">-not</span>(<span class="pl-vo">$Template</span>)){<span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>No Template Provided<span class="pl-pds">&quot;</span></span>;<span class="pl-k">break</span>}</td>
      </tr>
      <tr>
        <td id="L35" class="blob-num js-line-number" data-line-number="35"></td>
        <td id="LC35" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-k">-not</span>(<span class="pl-vo">$Location</span>)){<span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>No Location Provided<span class="pl-pds">&quot;</span></span>;<span class="pl-k">break</span>}</td>
      </tr>
      <tr>
        <td id="L36" class="blob-num js-line-number" data-line-number="36"></td>
        <td id="LC36" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-k">-not</span>(<span class="pl-vo">$ResourcePool</span>)){<span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>ResourcePool Not Provided<span class="pl-pds">&quot;</span></span>;<span class="pl-k">break</span>}</td>
      </tr>
      <tr>
        <td id="L37" class="blob-num js-line-number" data-line-number="37"></td>
        <td id="LC37" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L38" class="blob-num js-line-number" data-line-number="38"></td>
        <td id="LC38" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L39" class="blob-num js-line-number" data-line-number="39"></td>
        <td id="LC39" class="blob-code js-file-line"><span class="pl-k">try</span> {</td>
      </tr>
      <tr>
        <td id="L40" class="blob-num js-line-number" data-line-number="40"></td>
        <td id="LC40" class="blob-code js-file-line">        <span class="pl-k"><span class="pl-k">New-VM</span></span> <span class="pl-k">-</span>Name <span class="pl-vo">$Name</span> <span class="pl-k">-</span>ResourcePool <span class="pl-vo">$ResourcePool</span> <span class="pl-k">-</span>Template <span class="pl-vo">$Template</span> <span class="pl-k">-</span>Datastore <span class="pl-vo">$Datastore</span> <span class="pl-k">-</span>Location <span class="pl-vo">$Location</span> <span class="pl-k">-</span>ErrorAction <span class="pl-vo">$ErrorActionPreference</span></td>
      </tr>
      <tr>
        <td id="L41" class="blob-num js-line-number" data-line-number="41"></td>
        <td id="LC41" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L42" class="blob-num js-line-number" data-line-number="42"></td>
        <td id="LC42" class="blob-code js-file-line">        }</td>
      </tr>
      <tr>
        <td id="L43" class="blob-num js-line-number" data-line-number="43"></td>
        <td id="LC43" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L44" class="blob-num js-line-number" data-line-number="44"></td>
        <td id="LC44" class="blob-code js-file-line">catch { </td>
      </tr>
      <tr>
        <td id="L45" class="blob-num js-line-number" data-line-number="45"></td>
        <td id="LC45" class="blob-code js-file-line">        <span class="pl-vo">$Name</span> <span class="pl-k">+</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>$ErrorMessage = $_.Exception.Message<span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> <span class="pl-k"><span class="pl-k">Out-File</span></span> <span class="pl-k">-</span>FilePath <span class="pl-vo">$workingpath1</span> <span class="pl-k">-</span>Append</td>
      </tr>
      <tr>
        <td id="L46" class="blob-num js-line-number" data-line-number="46"></td>
        <td id="LC46" class="blob-code js-file-line">        <span class="pl-vo">$Name</span> <span class="pl-k">+</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>$FailedItem = $_.Exception.ItemName<span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> <span class="pl-k"><span class="pl-k">Out-File</span></span> <span class="pl-k">-</span>FilePath <span class="pl-vo">$workingpath1</span> <span class="pl-k">-</span>Append</td>
      </tr>
      <tr>
        <td id="L47" class="blob-num js-line-number" data-line-number="47"></td>
        <td id="LC47" class="blob-code js-file-line">        <span class="pl-k"><span class="pl-k">Send-MailMessage</span></span> <span class="pl-k">-</span>From <span class="pl-s1"><span class="pl-pds">&quot;</span>DoNotReply@scribestar.com<span class="pl-pds">&quot;</span></span> <span class="pl-k">-</span>To <span class="pl-vo">$EmailTo</span> <span class="pl-k">-</span>Subject <span class="pl-s1"><span class="pl-pds">&quot;</span>New VM Creation Fail<span class="pl-pds">&quot;</span></span> <span class="pl-k">-</span>Attachments <span class="pl-vo">$workingpath1</span> <span class="pl-k">-</span>SmtpServer <span class="pl-vo">$smtpserver</span></td>
      </tr>
      <tr>
        <td id="L48" class="blob-num js-line-number" data-line-number="48"></td>
        <td id="LC48" class="blob-code js-file-line">         }</td>
      </tr>
      <tr>
        <td id="L49" class="blob-num js-line-number" data-line-number="49"></td>
        <td id="LC49" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L50" class="blob-num js-line-number" data-line-number="50"></td>
        <td id="LC50" class="blob-code js-file-line">}</td>
      </tr>
      <tr>
        <td id="L51" class="blob-num js-line-number" data-line-number="51"></td>
        <td id="LC51" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L52" class="blob-num js-line-number" data-line-number="52"></td>
        <td id="LC52" class="blob-code js-file-line"><span class="pl-c">##Change Network Label</span></td>
      </tr>
      <tr>
        <td id="L53" class="blob-num js-line-number" data-line-number="53"></td>
        <td id="LC53" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L54" class="blob-num js-line-number" data-line-number="54"></td>
        <td id="LC54" class="blob-code js-file-line">Function <span class="pl-k"><span class="pl-k">Set-ScribestarNetwork</span></span> {</td>
      </tr>
      <tr>
        <td id="L55" class="blob-num js-line-number" data-line-number="55"></td>
        <td id="LC55" class="blob-code js-file-line"><span class="pl-k">param</span>([string]<span class="pl-vo">$VMName</span><span class="pl-k">=</span><span class="pl-vo">$null</span>,[string]<span class="pl-vo">$Network</span><span class="pl-k">=</span><span class="pl-vo">$null</span>)</td>
      </tr>
      <tr>
        <td id="L56" class="blob-num js-line-number" data-line-number="56"></td>
        <td id="LC56" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-k">-not</span>(<span class="pl-vo">$VMName</span>)){<span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>VMname Not Provided<span class="pl-pds">&quot;</span></span>}</td>
      </tr>
      <tr>
        <td id="L57" class="blob-num js-line-number" data-line-number="57"></td>
        <td id="LC57" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-k">-not</span>(<span class="pl-vo">$Network</span>)){<span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>Network Name Not Provided<span class="pl-pds">&quot;</span></span>}</td>
      </tr>
      <tr>
        <td id="L58" class="blob-num js-line-number" data-line-number="58"></td>
        <td id="LC58" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L59" class="blob-num js-line-number" data-line-number="59"></td>
        <td id="LC59" class="blob-code js-file-line"><span class="pl-k">try</span> {</td>
      </tr>
      <tr>
        <td id="L60" class="blob-num js-line-number" data-line-number="60"></td>
        <td id="LC60" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L61" class="blob-num js-line-number" data-line-number="61"></td>
        <td id="LC61" class="blob-code js-file-line">        <span class="pl-k"><span class="pl-k">Get-VM</span></span> <span class="pl-vo">$VMName</span> <span class="pl-k">|</span> <span class="pl-k"><span class="pl-k">Get-NetworkAdapter</span></span> <span class="pl-k">|</span> <span class="pl-k"><span class="pl-k">Set-NetworkAdapter</span></span> <span class="pl-k">-</span>NetworkName <span class="pl-vo">$Network</span> <span class="pl-k">-</span>Confirm:<span class="pl-vo">$false</span> <span class="pl-k">-</span>ErrorAction <span class="pl-vo">$ErrorActionPreference</span></td>
      </tr>
      <tr>
        <td id="L62" class="blob-num js-line-number" data-line-number="62"></td>
        <td id="LC62" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L63" class="blob-num js-line-number" data-line-number="63"></td>
        <td id="LC63" class="blob-code js-file-line">        }</td>
      </tr>
      <tr>
        <td id="L64" class="blob-num js-line-number" data-line-number="64"></td>
        <td id="LC64" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L65" class="blob-num js-line-number" data-line-number="65"></td>
        <td id="LC65" class="blob-code js-file-line">catch {</td>
      </tr>
      <tr>
        <td id="L66" class="blob-num js-line-number" data-line-number="66"></td>
        <td id="LC66" class="blob-code js-file-line">        </td>
      </tr>
      <tr>
        <td id="L67" class="blob-num js-line-number" data-line-number="67"></td>
        <td id="LC67" class="blob-code js-file-line">        <span class="pl-vo">$Network</span> <span class="pl-k">+</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>$ErrorMessage = $_.Exception.Message<span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> <span class="pl-k"><span class="pl-k">Out-File</span></span> <span class="pl-k">-</span>FilePath <span class="pl-vo">$workingpath2</span> <span class="pl-k">-</span>Append</td>
      </tr>
      <tr>
        <td id="L68" class="blob-num js-line-number" data-line-number="68"></td>
        <td id="LC68" class="blob-code js-file-line">        <span class="pl-vo">$Network</span> <span class="pl-k">+</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>$FailedItem = $_.Exception.ItemName<span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> <span class="pl-k"><span class="pl-k">Out-File</span></span> <span class="pl-vo">$workingpath2</span> <span class="pl-k">-</span>Append</td>
      </tr>
      <tr>
        <td id="L69" class="blob-num js-line-number" data-line-number="69"></td>
        <td id="LC69" class="blob-code js-file-line">        <span class="pl-k"><span class="pl-k">Send-MailMessage</span></span> <span class="pl-k">-</span>From <span class="pl-s1"><span class="pl-pds">&quot;</span>DoNotReply@scribestar.com<span class="pl-pds">&quot;</span></span> <span class="pl-k">-</span>To <span class="pl-vo">$EmailTo</span> <span class="pl-k">-</span>Subject <span class="pl-s1"><span class="pl-pds">&quot;</span>Network Label Error<span class="pl-pds">&quot;</span></span> <span class="pl-k">-</span>Attachments <span class="pl-vo">$workingpath2</span> <span class="pl-k">-</span>SmtpServer <span class="pl-vo">$smtpserver</span></td>
      </tr>
      <tr>
        <td id="L70" class="blob-num js-line-number" data-line-number="70"></td>
        <td id="LC70" class="blob-code js-file-line">        </td>
      </tr>
      <tr>
        <td id="L71" class="blob-num js-line-number" data-line-number="71"></td>
        <td id="LC71" class="blob-code js-file-line">        }</td>
      </tr>
      <tr>
        <td id="L72" class="blob-num js-line-number" data-line-number="72"></td>
        <td id="LC72" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L73" class="blob-num js-line-number" data-line-number="73"></td>
        <td id="LC73" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L74" class="blob-num js-line-number" data-line-number="74"></td>
        <td id="LC74" class="blob-code js-file-line">        }</td>
      </tr>
      <tr>
        <td id="L75" class="blob-num js-line-number" data-line-number="75"></td>
        <td id="LC75" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L76" class="blob-num js-line-number" data-line-number="76"></td>
        <td id="LC76" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L77" class="blob-num js-line-number" data-line-number="77"></td>
        <td id="LC77" class="blob-code js-file-line"><span class="pl-c">##Add New HardDisk</span></td>
      </tr>
      <tr>
        <td id="L78" class="blob-num js-line-number" data-line-number="78"></td>
        <td id="LC78" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L79" class="blob-num js-line-number" data-line-number="79"></td>
        <td id="LC79" class="blob-code js-file-line">Function <span class="pl-k"><span class="pl-k">New-ScribestarHardDisk</span></span> {</td>
      </tr>
      <tr>
        <td id="L80" class="blob-num js-line-number" data-line-number="80"></td>
        <td id="LC80" class="blob-code js-file-line"><span class="pl-k">param</span>([string]<span class="pl-vo">$Name</span><span class="pl-k">=</span><span class="pl-vo">$null</span>,[string]<span class="pl-vo">$CapacityGB</span><span class="pl-k">=</span><span class="pl-vo">$null</span>,[switch]<span class="pl-vo">$Thin</span>,[switch]<span class="pl-vo">$Thick</span>)</td>
      </tr>
      <tr>
        <td id="L81" class="blob-num js-line-number" data-line-number="81"></td>
        <td id="LC81" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L82" class="blob-num js-line-number" data-line-number="82"></td>
        <td id="LC82" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-k">-not</span>(<span class="pl-vo">$CapacityGB</span>)){<span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>Must Specify Storage Capacity<span class="pl-pds">&quot;</span></span>;<span class="pl-k">break</span>}</td>
      </tr>
      <tr>
        <td id="L83" class="blob-num js-line-number" data-line-number="83"></td>
        <td id="LC83" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-vo">$Thin</span> <span class="pl-k">-</span>eq <span class="pl-vo">$true</span> <span class="pl-k">-</span><span class="pl-k">and</span> <span class="pl-vo">$Thick</span> <span class="pl-k">-</span>eq <span class="pl-vo">$true</span>){<span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>Cannot Specify Two Storage Formats<span class="pl-pds">&quot;</span></span>;<span class="pl-k">break</span>}</td>
      </tr>
      <tr>
        <td id="L84" class="blob-num js-line-number" data-line-number="84"></td>
        <td id="LC84" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-vo">$Thin</span> <span class="pl-k">-</span>eq <span class="pl-vo">$true</span>){<span class="pl-vo">$StorageFormat</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>Thin<span class="pl-pds">&quot;</span></span>}</td>
      </tr>
      <tr>
        <td id="L85" class="blob-num js-line-number" data-line-number="85"></td>
        <td id="LC85" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-vo">$Thick</span> <span class="pl-k">-</span>eq <span class="pl-vo">$true</span>){<span class="pl-vo">$StorageFormat</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>Thick<span class="pl-pds">&quot;</span></span>}</td>
      </tr>
      <tr>
        <td id="L86" class="blob-num js-line-number" data-line-number="86"></td>
        <td id="LC86" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-vo">$Thin</span> <span class="pl-k">-</span>eq <span class="pl-vo">$false</span> <span class="pl-k">-</span><span class="pl-k">and</span> <span class="pl-vo">$Thick</span> <span class="pl-k">-</span>eq <span class="pl-vo">$false</span>){<span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>Must Specify StorageFormat<span class="pl-pds">&quot;</span></span>;<span class="pl-k">break</span>}</td>
      </tr>
      <tr>
        <td id="L87" class="blob-num js-line-number" data-line-number="87"></td>
        <td id="LC87" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L88" class="blob-num js-line-number" data-line-number="88"></td>
        <td id="LC88" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L89" class="blob-num js-line-number" data-line-number="89"></td>
        <td id="LC89" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L90" class="blob-num js-line-number" data-line-number="90"></td>
        <td id="LC90" class="blob-code js-file-line"><span class="pl-k">try</span> {</td>
      </tr>
      <tr>
        <td id="L91" class="blob-num js-line-number" data-line-number="91"></td>
        <td id="LC91" class="blob-code js-file-line">        <span class="pl-k"><span class="pl-k">New-HardDisk</span></span> <span class="pl-k">-</span>VM <span class="pl-vo">$Name</span> <span class="pl-k">-</span>CapacityGB <span class="pl-vo">$CapacityGB</span> <span class="pl-k">-</span>StorageFormat <span class="pl-vo">$StorageFormat</span> <span class="pl-k">-</span>Persistence Persistent <span class="pl-k">-</span>ErrorAction <span class="pl-vo">$ErrorActionPreference</span></td>
      </tr>
      <tr>
        <td id="L92" class="blob-num js-line-number" data-line-number="92"></td>
        <td id="LC92" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L93" class="blob-num js-line-number" data-line-number="93"></td>
        <td id="LC93" class="blob-code js-file-line">        }</td>
      </tr>
      <tr>
        <td id="L94" class="blob-num js-line-number" data-line-number="94"></td>
        <td id="LC94" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L95" class="blob-num js-line-number" data-line-number="95"></td>
        <td id="LC95" class="blob-code js-file-line">        catch {</td>
      </tr>
      <tr>
        <td id="L96" class="blob-num js-line-number" data-line-number="96"></td>
        <td id="LC96" class="blob-code js-file-line">                    <span class="pl-vo">$Name</span> <span class="pl-k">+</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>$ErrorMessage = $_.Exception.Message<span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> <span class="pl-k"><span class="pl-k">Out-File</span></span> <span class="pl-k">-</span>FilePath <span class="pl-vo">$workingpath5</span> <span class="pl-k">-</span>Append</td>
      </tr>
      <tr>
        <td id="L97" class="blob-num js-line-number" data-line-number="97"></td>
        <td id="LC97" class="blob-code js-file-line">                    <span class="pl-vo">$Name</span> <span class="pl-k">+</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>$FailedItem = $_.Exception.ItemName<span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> <span class="pl-k"><span class="pl-k">Out-File</span></span> <span class="pl-k">-</span>FilePath <span class="pl-vo">$workingpath5</span> <span class="pl-k">-</span>Append</td>
      </tr>
      <tr>
        <td id="L98" class="blob-num js-line-number" data-line-number="98"></td>
        <td id="LC98" class="blob-code js-file-line">                    <span class="pl-k"><span class="pl-k">Send-MailMessage</span></span> <span class="pl-k">-</span>From <span class="pl-s1"><span class="pl-pds">&quot;</span>DoNotReply@scribestar.com<span class="pl-pds">&quot;</span></span> <span class="pl-k">-</span>To <span class="pl-vo">$EmailTo</span> <span class="pl-k">-</span>Subject <span class="pl-s1"><span class="pl-pds">&quot;</span>New HardDisk Error<span class="pl-pds">&quot;</span></span> <span class="pl-k">-</span>Attachments <span class="pl-vo">$workingpath5</span> <span class="pl-k">-</span>SmtpServer <span class="pl-vo">$smtpserver</span></td>
      </tr>
      <tr>
        <td id="L99" class="blob-num js-line-number" data-line-number="99"></td>
        <td id="LC99" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L100" class="blob-num js-line-number" data-line-number="100"></td>
        <td id="LC100" class="blob-code js-file-line">                    }</td>
      </tr>
      <tr>
        <td id="L101" class="blob-num js-line-number" data-line-number="101"></td>
        <td id="LC101" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L102" class="blob-num js-line-number" data-line-number="102"></td>
        <td id="LC102" class="blob-code js-file-line">}</td>
      </tr>
      <tr>
        <td id="L103" class="blob-num js-line-number" data-line-number="103"></td>
        <td id="LC103" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L104" class="blob-num js-line-number" data-line-number="104"></td>
        <td id="LC104" class="blob-code js-file-line"><span class="pl-c">################VM Details###################</span></td>
      </tr>
      <tr>
        <td id="L105" class="blob-num js-line-number" data-line-number="105"></td>
        <td id="LC105" class="blob-code js-file-line"><span class="pl-vo">$VM</span><span class="pl-k">=</span><span class="pl-s1"><span class="pl-pds">&quot;</span>BETAWIN-RAVEN01<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L106" class="blob-num js-line-number" data-line-number="106"></td>
        <td id="LC106" class="blob-code js-file-line"><span class="pl-vo">$Resource</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>Resources<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L107" class="blob-num js-line-number" data-line-number="107"></td>
        <td id="LC107" class="blob-code js-file-line"><span class="pl-vo">$Template</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>WIN2012R2-TEMPLATE<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L108" class="blob-num js-line-number" data-line-number="108"></td>
        <td id="LC108" class="blob-code js-file-line"><span class="pl-vo">$Folder</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>BETA<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L109" class="blob-num js-line-number" data-line-number="109"></td>
        <td id="LC109" class="blob-code js-file-line"><span class="pl-vo">$Network</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>PROD_DATA<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L110" class="blob-num js-line-number" data-line-number="110"></td>
        <td id="LC110" class="blob-code js-file-line"><span class="pl-vo">$CapacityGB</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>10<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L111" class="blob-num js-line-number" data-line-number="111"></td>
        <td id="LC111" class="blob-code js-file-line"><span class="pl-vo">$Location</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>BETA<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L112" class="blob-num js-line-number" data-line-number="112"></td>
        <td id="LC112" class="blob-code js-file-line"><span class="pl-vo">$Datastore</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>VMS-DATASTORE<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L113" class="blob-num js-line-number" data-line-number="113"></td>
        <td id="LC113" class="blob-code js-file-line"><span class="pl-vo">$OUPath</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>OU=BETA,OU=Servers,OU=United Kingdom,OU=Resource,DC=SCRIBESTAR,DC=INTERNAL<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L114" class="blob-num js-line-number" data-line-number="114"></td>
        <td id="LC114" class="blob-code js-file-line"><span class="pl-c">#############################################</span></td>
      </tr>
      <tr>
        <td id="L115" class="blob-num js-line-number" data-line-number="115"></td>
        <td id="LC115" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L116" class="blob-num js-line-number" data-line-number="116"></td>
        <td id="LC116" class="blob-code js-file-line"><span class="pl-vo">$VMExists</span> <span class="pl-k">=</span> <span class="pl-k"><span class="pl-k">Get-VM</span></span> <span class="pl-k">-</span>Name <span class="pl-vo">$VM</span> <span class="pl-k">-</span>ErrorAction SilentlyContinue</td>
      </tr>
      <tr>
        <td id="L117" class="blob-num js-line-number" data-line-number="117"></td>
        <td id="LC117" class="blob-code js-file-line"><span class="pl-k">if</span>(<span class="pl-vo">$VMExists</span>.Name <span class="pl-k">-</span>eq <span class="pl-vo">$VM</span>){<span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>$VM All Ready Exists<span class="pl-pds">&quot;</span></span>}</td>
      </tr>
      <tr>
        <td id="L118" class="blob-num js-line-number" data-line-number="118"></td>
        <td id="LC118" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L119" class="blob-num js-line-number" data-line-number="119"></td>
        <td id="LC119" class="blob-code js-file-line"><span class="pl-k">else</span> {</td>
      </tr>
      <tr>
        <td id="L120" class="blob-num js-line-number" data-line-number="120"></td>
        <td id="LC120" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L121" class="blob-num js-line-number" data-line-number="121"></td>
        <td id="LC121" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L122" class="blob-num js-line-number" data-line-number="122"></td>
        <td id="LC122" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>Creating VM&#39;s<span class="pl-pds">&quot;</span></span> <span class="pl-k">-</span>ForegroundColor Blue <span class="pl-k">-</span>BackgroundColor Yellow</td>
      </tr>
      <tr>
        <td id="L123" class="blob-num js-line-number" data-line-number="123"></td>
        <td id="LC123" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L124" class="blob-num js-line-number" data-line-number="124"></td>
        <td id="LC124" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">New-ScribestarVM</span></span> <span class="pl-k">-</span>Name <span class="pl-vo">$VM</span> <span class="pl-k">-</span>ResourcePool <span class="pl-vo">$Resource</span> <span class="pl-k">-</span>Datastore <span class="pl-vo">$Datastore</span> <span class="pl-k">-</span>Template <span class="pl-vo">$Template</span> <span class="pl-k">-</span>Location <span class="pl-vo">$Location</span></td>
      </tr>
      <tr>
        <td id="L125" class="blob-num js-line-number" data-line-number="125"></td>
        <td id="LC125" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Start-Sleep</span></span> <span class="pl-k">-</span>Seconds <span class="pl-c1">30</span></td>
      </tr>
      <tr>
        <td id="L126" class="blob-num js-line-number" data-line-number="126"></td>
        <td id="LC126" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Set-ScribestarNetwork</span></span> <span class="pl-k">-</span>VMName <span class="pl-vo">$VM</span> <span class="pl-k">-</span>Network <span class="pl-vo">$Network</span></td>
      </tr>
      <tr>
        <td id="L127" class="blob-num js-line-number" data-line-number="127"></td>
        <td id="LC127" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">New-ScribestarHardDisk</span></span> <span class="pl-k">-</span>Name <span class="pl-vo">$VM</span> <span class="pl-k">-</span>CapacityGB <span class="pl-vo">$CapacityGB</span> <span class="pl-k">-</span>Thin</td>
      </tr>
      <tr>
        <td id="L128" class="blob-num js-line-number" data-line-number="128"></td>
        <td id="LC128" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Start-VM</span></span> <span class="pl-k">-</span>VM <span class="pl-vo">$VM</span></td>
      </tr>
      <tr>
        <td id="L129" class="blob-num js-line-number" data-line-number="129"></td>
        <td id="LC129" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Start-Sleep</span></span> <span class="pl-k">-</span>Seconds <span class="pl-c1">60</span></td>
      </tr>
      <tr>
        <td id="L130" class="blob-num js-line-number" data-line-number="130"></td>
        <td id="LC130" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L131" class="blob-num js-line-number" data-line-number="131"></td>
        <td id="LC131" class="blob-code js-file-line"><span class="pl-c">######Authentication##########</span></td>
      </tr>
      <tr>
        <td id="L132" class="blob-num js-line-number" data-line-number="132"></td>
        <td id="LC132" class="blob-code js-file-line"><span class="pl-vo">$guestuser</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>administrator<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L133" class="blob-num js-line-number" data-line-number="133"></td>
        <td id="LC133" class="blob-code js-file-line"><span class="pl-vo">$guestpassword</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>G00gle1t<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L134" class="blob-num js-line-number" data-line-number="134"></td>
        <td id="LC134" class="blob-code js-file-line"><span class="pl-vo">$hostuser</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>root<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L135" class="blob-num js-line-number" data-line-number="135"></td>
        <td id="LC135" class="blob-code js-file-line"><span class="pl-vo">$hostpassword</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>scribestar<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L136" class="blob-num js-line-number" data-line-number="136"></td>
        <td id="LC136" class="blob-code js-file-line"><span class="pl-c">##############################</span></td>
      </tr>
      <tr>
        <td id="L137" class="blob-num js-line-number" data-line-number="137"></td>
        <td id="LC137" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L138" class="blob-num js-line-number" data-line-number="138"></td>
        <td id="LC138" class="blob-code js-file-line"><span class="pl-vo">$VMBETARAVEN01</span> <span class="pl-k">=</span> @<span class="pl-s1"><span class="pl-pds">&#39;</span><span class="pl-ii"></span></span></td>
      </tr>
      <tr>
        <td id="L139" class="blob-num js-line-number" data-line-number="139"></td>
        <td id="LC139" class="blob-code js-file-line"><span class="pl-vo">$Computerinfo</span> <span class="pl-k">=</span> <span class="pl-k"><span class="pl-k">Get-WmiObject</span></span> <span class="pl-k">-</span>Class Win32_ComputerSystem</td>
      </tr>
      <tr>
        <td id="L140" class="blob-num js-line-number" data-line-number="140"></td>
        <td id="LC140" class="blob-code js-file-line"><span class="pl-vo">$Computerinfo</span>.Rename(<span class="pl-s1"><span class="pl-pds">&quot;</span>BETAWIN-RAVEN01<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L141" class="blob-num js-line-number" data-line-number="141"></td>
        <td id="LC141" class="blob-code js-file-line"><span class="pl-s1"><span class="pl-pds">&#39;</span>@<span class="pl-ii"></span></span></td>
      </tr>
      <tr>
        <td id="L142" class="blob-num js-line-number" data-line-number="142"></td>
        <td id="LC142" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Invoke-VMScript</span></span> <span class="pl-k">-</span>VM <span class="pl-vo">$VM</span> <span class="pl-k">-</span>ScriptText <span class="pl-vo">$VMBETARAVEN01</span> <span class="pl-k">-</span>ScriptType Powershell <span class="pl-k">-</span>GuestUser <span class="pl-vo">$guestuser</span> <span class="pl-k">-</span>GuestPassword <span class="pl-vo">$guestpassword</span> <span class="pl-k">-</span>HostUser <span class="pl-vo">$hostuser</span> <span class="pl-k">-</span>HostPassword <span class="pl-vo">$hostpassword</span></td>
      </tr>
      <tr>
        <td id="L143" class="blob-num js-line-number" data-line-number="143"></td>
        <td id="LC143" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L144" class="blob-num js-line-number" data-line-number="144"></td>
        <td id="LC144" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>Rebooting VM&#39;s<span class="pl-pds">&quot;</span></span> <span class="pl-k">-</span>BackgroundColor Cyan <span class="pl-k">-</span>ForegroundColor DarkMagenta</td>
      </tr>
      <tr>
        <td id="L145" class="blob-num js-line-number" data-line-number="145"></td>
        <td id="LC145" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L146" class="blob-num js-line-number" data-line-number="146"></td>
        <td id="LC146" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Restart-VMGuest</span></span> <span class="pl-k">-</span>VM <span class="pl-vo">$VM</span> <span class="pl-k">-</span>Confirm:<span class="pl-vo">$false</span></td>
      </tr>
      <tr>
        <td id="L147" class="blob-num js-line-number" data-line-number="147"></td>
        <td id="LC147" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Start-Sleep</span></span> <span class="pl-k">-</span>Seconds <span class="pl-c1">120</span></td>
      </tr>
      <tr>
        <td id="L148" class="blob-num js-line-number" data-line-number="148"></td>
        <td id="LC148" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L149" class="blob-num js-line-number" data-line-number="149"></td>
        <td id="LC149" class="blob-code js-file-line"><span class="pl-vo">$VMBETARAVEN01</span> <span class="pl-k">=</span> @<span class="pl-s1"><span class="pl-pds">&#39;</span><span class="pl-ii"></span></span></td>
      </tr>
      <tr>
        <td id="L150" class="blob-num js-line-number" data-line-number="150"></td>
        <td id="LC150" class="blob-code js-file-line"><span class="pl-vo">$IP</span><span class="pl-k">=</span><span class="pl-s1"><span class="pl-pds">&quot;</span>10.1.0.32<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L151" class="blob-num js-line-number" data-line-number="151"></td>
        <td id="LC151" class="blob-code js-file-line"><span class="pl-vo">$Prefix</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>24<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L152" class="blob-num js-line-number" data-line-number="152"></td>
        <td id="LC152" class="blob-code js-file-line"><span class="pl-vo">$Gateway</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>10.1.0.1<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L153" class="blob-num js-line-number" data-line-number="153"></td>
        <td id="LC153" class="blob-code js-file-line"><span class="pl-vo">$DNS1</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>10.1.2.34<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L154" class="blob-num js-line-number" data-line-number="154"></td>
        <td id="LC154" class="blob-code js-file-line"><span class="pl-vo">$DNS2</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>10.1.2.35<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L155" class="blob-num js-line-number" data-line-number="155"></td>
        <td id="LC155" class="blob-code js-file-line"><span class="pl-vo">$Domain</span> <span class="pl-k">=</span> SCRIBESTAR.INTERNAL</td>
      </tr>
      <tr>
        <td id="L156" class="blob-num js-line-number" data-line-number="156"></td>
        <td id="LC156" class="blob-code js-file-line"><span class="pl-vo">$OUPath</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>OU=BETA,OU=Servers,OU=United Kingdom,OU=Resource,DC=SCRIBESTAR,DC=INTERNAL<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L157" class="blob-num js-line-number" data-line-number="157"></td>
        <td id="LC157" class="blob-code js-file-line"><span class="pl-vo">$domainuser</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>SVCJOINDOMAIN<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L158" class="blob-num js-line-number" data-line-number="158"></td>
        <td id="LC158" class="blob-code js-file-line"><span class="pl-vo">$domainpassword</span> <span class="pl-k">=</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>7UUBDUNQHtJzVxtwtPN01<span class="pl-pds">&quot;</span></span> <span class="pl-k">|</span> <span class="pl-k"><span class="pl-k">ConvertTo-SecureString</span></span> <span class="pl-k">-</span>AsPlainText <span class="pl-k">-</span>Force</td>
      </tr>
      <tr>
        <td id="L159" class="blob-num js-line-number" data-line-number="159"></td>
        <td id="LC159" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">New-NetIPAddress</span></span> <span class="pl-k">-</span>InterfaceAlias <span class="pl-s1"><span class="pl-pds">&quot;</span>Ethernet<span class="pl-pds">&quot;</span></span> <span class="pl-k">-</span>IPAddress <span class="pl-vo">$IP</span> <span class="pl-k">-</span>PrefixLength <span class="pl-vo">$Prefix</span> <span class="pl-k">-</span>DefaultGateway <span class="pl-vo">$Gateway</span></td>
      </tr>
      <tr>
        <td id="L160" class="blob-num js-line-number" data-line-number="160"></td>
        <td id="LC160" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Set-DnsClientServerAddress</span></span> <span class="pl-k">-</span>InterfaceAlias <span class="pl-s1"><span class="pl-pds">&quot;</span>Ethernet<span class="pl-pds">&quot;</span></span> <span class="pl-k">-</span>ServerAddresses (<span class="pl-vo">$DNS1</span>,<span class="pl-vo">$DNS2</span>)</td>
      </tr>
      <tr>
        <td id="L161" class="blob-num js-line-number" data-line-number="161"></td>
        <td id="LC161" class="blob-code js-file-line"><span class="pl-vo">$cred</span> <span class="pl-k">=</span> <span class="pl-k"><span class="pl-k">New-Object</span></span> <span class="pl-k">-</span>TypeName System.Management.Automation.PSCredential <span class="pl-k">-</span>ArgumentList <span class="pl-vo">$domainuser</span>,<span class="pl-vo">$domainpassword</span></td>
      </tr>
      <tr>
        <td id="L162" class="blob-num js-line-number" data-line-number="162"></td>
        <td id="LC162" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Start-Sleep</span></span> <span class="pl-k">-</span>Seconds <span class="pl-c1">10</span></td>
      </tr>
      <tr>
        <td id="L163" class="blob-num js-line-number" data-line-number="163"></td>
        <td id="LC163" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Add-Computer</span></span> <span class="pl-k">-</span>DomainName <span class="pl-vo">$Domain</span> <span class="pl-k">-</span>OUPath <span class="pl-vo">$OUPath</span> <span class="pl-k">-</span>Credential <span class="pl-vo">$cred</span></td>
      </tr>
      <tr>
        <td id="L164" class="blob-num js-line-number" data-line-number="164"></td>
        <td id="LC164" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L165" class="blob-num js-line-number" data-line-number="165"></td>
        <td id="LC165" class="blob-code js-file-line"><span class="pl-s1"><span class="pl-pds">&#39;</span>@<span class="pl-ii"></span></span></td>
      </tr>
      <tr>
        <td id="L166" class="blob-num js-line-number" data-line-number="166"></td>
        <td id="LC166" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Invoke-VMScript</span></span> <span class="pl-k">-</span>VM <span class="pl-vo">$VM</span> <span class="pl-k">-</span>ScriptText <span class="pl-vo">$VMBETARAVEN01</span> <span class="pl-k">-</span>ScriptType Powershell <span class="pl-k">-</span>GuestUser <span class="pl-vo">$guestuser</span> <span class="pl-k">-</span>GuestPassword <span class="pl-vo">$guestpassword</span> <span class="pl-k">-</span>HostUser <span class="pl-vo">$hostuser</span> <span class="pl-k">-</span>HostPassword <span class="pl-vo">$hostpassword</span></td>
      </tr>
      <tr>
        <td id="L167" class="blob-num js-line-number" data-line-number="167"></td>
        <td id="LC167" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Restart-VMGuest</span></span> <span class="pl-k">-</span>VM <span class="pl-vo">$VM</span> <span class="pl-k">-</span>Confirm:<span class="pl-vo">$false</span></td>
      </tr>
      <tr>
        <td id="L168" class="blob-num js-line-number" data-line-number="168"></td>
        <td id="LC168" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Start-Sleep</span></span> <span class="pl-k">-</span>Seconds <span class="pl-c1">300</span></td>
      </tr>
      <tr>
        <td id="L169" class="blob-num js-line-number" data-line-number="169"></td>
        <td id="LC169" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L170" class="blob-num js-line-number" data-line-number="170"></td>
        <td id="LC170" class="blob-code js-file-line"><span class="pl-k">&amp;</span> ipconfig <span class="pl-s1"><span class="pl-pds">&quot;</span>/flushdns<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L171" class="blob-num js-line-number" data-line-number="171"></td>
        <td id="LC171" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L172" class="blob-num js-line-number" data-line-number="172"></td>
        <td id="LC172" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>Configuring HardDisk<span class="pl-pds">&quot;</span></span> <span class="pl-k">-</span>ForegroundColor Green <span class="pl-k">-</span>BackgroundColor Red</td>
      </tr>
      <tr>
        <td id="L173" class="blob-num js-line-number" data-line-number="173"></td>
        <td id="LC173" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L174" class="blob-num js-line-number" data-line-number="174"></td>
        <td id="LC174" class="blob-code js-file-line"><span class="pl-vo">$server</span> <span class="pl-k">=</span> <span class="pl-k"><span class="pl-k">Get-ADComputer</span></span> <span class="pl-k">-</span>Identity <span class="pl-vo">$VM</span> <span class="pl-k">-</span>Properties <span class="pl-k">*</span></td>
      </tr>
      <tr>
        <td id="L175" class="blob-num js-line-number" data-line-number="175"></td>
        <td id="LC175" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L176" class="blob-num js-line-number" data-line-number="176"></td>
        <td id="LC176" class="blob-code js-file-line"><span class="pl-k"><span class="pl-k">Invoke-Command</span></span> <span class="pl-k">-</span>ComputerName <span class="pl-vo">$server</span>.Name <span class="pl-k">-</span>ScriptBlock {</td>
      </tr>
      <tr>
        <td id="L177" class="blob-num js-line-number" data-line-number="177"></td>
        <td id="LC177" class="blob-code js-file-line">                                </td>
      </tr>
      <tr>
        <td id="L178" class="blob-num js-line-number" data-line-number="178"></td>
        <td id="LC178" class="blob-code js-file-line">                                <span class="pl-k">if</span>((<span class="pl-k"><span class="pl-k">Get-WmiObject</span></span> Win32_cdromdrive).drive <span class="pl-k">-</span>eq <span class="pl-s1"><span class="pl-pds">&quot;</span>D:<span class="pl-pds">&quot;</span></span>) </td>
      </tr>
      <tr>
        <td id="L179" class="blob-num js-line-number" data-line-number="179"></td>
        <td id="LC179" class="blob-code js-file-line">                                {</td>
      </tr>
      <tr>
        <td id="L180" class="blob-num js-line-number" data-line-number="180"></td>
        <td id="LC180" class="blob-code js-file-line">                                    (<span class="pl-k"><span class="pl-k">Get-WmiObject</span></span> Win32_cdromdrive).drive <span class="pl-k">|</span> <span class="pl-k"><span class="pl-k">ForEach-Object</span></span> {<span class="pl-vo">$a</span> <span class="pl-k">=</span> mountvol <span class="pl-vo">$_</span> <span class="pl-k">/</span>l;mountvol <span class="pl-vo">$_</span> <span class="pl-k">/</span>d; <span class="pl-vo">$a</span> <span class="pl-k">=</span> <span class="pl-vo">$a</span>.Trim();mountvol R: <span class="pl-vo">$a</span>}</td>
      </tr>
      <tr>
        <td id="L181" class="blob-num js-line-number" data-line-number="181"></td>
        <td id="LC181" class="blob-code js-file-line">                                    </td>
      </tr>
      <tr>
        <td id="L182" class="blob-num js-line-number" data-line-number="182"></td>
        <td id="LC182" class="blob-code js-file-line">                                    }                  </td>
      </tr>
      <tr>
        <td id="L183" class="blob-num js-line-number" data-line-number="183"></td>
        <td id="LC183" class="blob-code js-file-line">                                      </td>
      </tr>
      <tr>
        <td id="L184" class="blob-num js-line-number" data-line-number="184"></td>
        <td id="LC184" class="blob-code js-file-line">                                      <span class="pl-vo">$volume</span> <span class="pl-k">=</span> <span class="pl-k"><span class="pl-k">Get-Volume</span></span></td>
      </tr>
      <tr>
        <td id="L185" class="blob-num js-line-number" data-line-number="185"></td>
        <td id="LC185" class="blob-code js-file-line">                                      <span class="pl-k">if</span>((<span class="pl-vo">$volume</span>.DriveLetter <span class="pl-k">-</span>eq <span class="pl-s1"><span class="pl-pds">&quot;</span>D<span class="pl-pds">&quot;</span></span>) <span class="pl-k">-</span><span class="pl-k">and</span> (<span class="pl-vo">$volume</span>.DriveType <span class="pl-k">-</span>eq <span class="pl-s1"><span class="pl-pds">&quot;</span>Fixed<span class="pl-pds">&quot;</span></span>)){<span class="pl-k"><span class="pl-k">Write-Host</span></span> <span class="pl-s1"><span class="pl-pds">&quot;</span>Driver Letter All Ready Exists<span class="pl-pds">&quot;</span></span>}</td>
      </tr>
      <tr>
        <td id="L186" class="blob-num js-line-number" data-line-number="186"></td>
        <td id="LC186" class="blob-code js-file-line">                                      <span class="pl-k">else</span> {</td>
      </tr>
      <tr>
        <td id="L187" class="blob-num js-line-number" data-line-number="187"></td>
        <td id="LC187" class="blob-code js-file-line">                                      <span class="pl-vo">$offlinedisk</span> <span class="pl-k">=</span> <span class="pl-k"><span class="pl-k">Get-Disk</span></span> <span class="pl-k">|</span> <span class="pl-k"><span class="pl-k">Where-Object</span></span> {<span class="pl-vo">$_</span>.OperationalStatus <span class="pl-k">-</span>eq <span class="pl-s1"><span class="pl-pds">&quot;</span>Offline<span class="pl-pds">&quot;</span></span>}</td>
      </tr>
      <tr>
        <td id="L188" class="blob-num js-line-number" data-line-number="188"></td>
        <td id="LC188" class="blob-code js-file-line">                                      <span class="pl-k"><span class="pl-k">Set-Disk</span></span> <span class="pl-k">-</span>Number <span class="pl-vo">$offlinedisk</span>.Number <span class="pl-k">-</span>IsOffline <span class="pl-vo">$false</span></td>
      </tr>
      <tr>
        <td id="L189" class="blob-num js-line-number" data-line-number="189"></td>
        <td id="LC189" class="blob-code js-file-line">                                      <span class="pl-k"><span class="pl-k">Initialize-Disk</span></span> <span class="pl-k">-</span>Number <span class="pl-vo">$offlinedisk</span>.Number <span class="pl-k">-</span>PartitionStyle MBR</td>
      </tr>
      <tr>
        <td id="L190" class="blob-num js-line-number" data-line-number="190"></td>
        <td id="LC190" class="blob-code js-file-line">                                      <span class="pl-k"><span class="pl-k">New-Partition</span></span> <span class="pl-k">-</span>DiskNumber <span class="pl-vo">$offlinedisk</span>.Number <span class="pl-k">-</span>AssignDriveLetter <span class="pl-k">-</span>UseMaximumSize</td>
      </tr>
      <tr>
        <td id="L191" class="blob-num js-line-number" data-line-number="191"></td>
        <td id="LC191" class="blob-code js-file-line">                                      <span class="pl-vo">$diskvolume</span> <span class="pl-k">=</span> <span class="pl-k"><span class="pl-k">Get-Volume</span></span> <span class="pl-k">|</span> <span class="pl-k"><span class="pl-k">Where-Object</span></span> {(<span class="pl-vo">$_</span>.FileSystem <span class="pl-k">-ne</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>NTFS<span class="pl-pds">&quot;</span></span> <span class="pl-k">-</span><span class="pl-k">and</span> <span class="pl-vo">$_</span>.Size <span class="pl-k">-</span>like <span class="pl-s1"><span class="pl-pds">&quot;</span>0*<span class="pl-pds">&quot;</span></span> <span class="pl-k">-</span><span class="pl-k">and</span> <span class="pl-vo">$_</span>.DriveType <span class="pl-k">-</span>eq <span class="pl-s1"><span class="pl-pds">&quot;</span>Fixed<span class="pl-pds">&quot;</span></span>)} </td>
      </tr>
      <tr>
        <td id="L192" class="blob-num js-line-number" data-line-number="192"></td>
        <td id="LC192" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L193" class="blob-num js-line-number" data-line-number="193"></td>
        <td id="LC193" class="blob-code js-file-line">                                            <span class="pl-k">try</span> {</td>
      </tr>
      <tr>
        <td id="L194" class="blob-num js-line-number" data-line-number="194"></td>
        <td id="LC194" class="blob-code js-file-line">                                                    <span class="pl-k"><span class="pl-k">Set-Partition</span></span> <span class="pl-k">-</span>DriveLetter <span class="pl-vo">$diskvolume</span>.DriveLetter <span class="pl-k">-</span>NewDriveLetter D <span class="pl-k">-</span>ErrorAction SilentlyContinue</td>
      </tr>
      <tr>
        <td id="L195" class="blob-num js-line-number" data-line-number="195"></td>
        <td id="LC195" class="blob-code js-file-line">                                                    </td>
      </tr>
      <tr>
        <td id="L196" class="blob-num js-line-number" data-line-number="196"></td>
        <td id="LC196" class="blob-code js-file-line">                                                    }</td>
      </tr>
      <tr>
        <td id="L197" class="blob-num js-line-number" data-line-number="197"></td>
        <td id="LC197" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L198" class="blob-num js-line-number" data-line-number="198"></td>
        <td id="LC198" class="blob-code js-file-line">                                                        catch {</td>
      </tr>
      <tr>
        <td id="L199" class="blob-num js-line-number" data-line-number="199"></td>
        <td id="LC199" class="blob-code js-file-line">                                                                    <span class="pl-vo">$env</span>:COMPUTERNAME <span class="pl-k">+</span> <span class="pl-s1"><span class="pl-pds">&quot;</span>The requested access path is already in use.<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L200" class="blob-num js-line-number" data-line-number="200"></td>
        <td id="LC200" class="blob-code js-file-line">                                                                   </td>
      </tr>
      <tr>
        <td id="L201" class="blob-num js-line-number" data-line-number="201"></td>
        <td id="LC201" class="blob-code js-file-line">                                                                   }</td>
      </tr>
      <tr>
        <td id="L202" class="blob-num js-line-number" data-line-number="202"></td>
        <td id="LC202" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L203" class="blob-num js-line-number" data-line-number="203"></td>
        <td id="LC203" class="blob-code js-file-line">                                                        <span class="pl-k"><span class="pl-k">Format-Volume</span></span> <span class="pl-k">-</span>DriveLetter D <span class="pl-k">-</span>FileSystem NTFS <span class="pl-k">-</span>Confirm:<span class="pl-vo">$false</span></td>
      </tr>
      <tr>
        <td id="L204" class="blob-num js-line-number" data-line-number="204"></td>
        <td id="LC204" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L205" class="blob-num js-line-number" data-line-number="205"></td>
        <td id="LC205" class="blob-code js-file-line">                                                        }</td>
      </tr>
      <tr>
        <td id="L206" class="blob-num js-line-number" data-line-number="206"></td>
        <td id="LC206" class="blob-code js-file-line">                                                        </td>
      </tr>
      <tr>
        <td id="L207" class="blob-num js-line-number" data-line-number="207"></td>
        <td id="LC207" class="blob-code js-file-line">                                                        }</td>
      </tr>
      <tr>
        <td id="L208" class="blob-num js-line-number" data-line-number="208"></td>
        <td id="LC208" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L209" class="blob-num js-line-number" data-line-number="209"></td>
        <td id="LC209" class="blob-code js-file-line">                              </td>
      </tr>
      <tr>
        <td id="L210" class="blob-num js-line-number" data-line-number="210"></td>
        <td id="LC210" class="blob-code js-file-line">                              }</td>
      </tr>
</table>

  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="https://developer.github.com">API</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>

    </ul>

    <a href="/" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2015 <span title="0.07285s from github-fe132-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-suggester-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="fullscreen-contents js-fullscreen-contents" placeholder=""></textarea>
      <div class="suggester-container">
        <div class="suggester fullscreen-suggester js-suggester js-navigation-container"></div>
      </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped tooltipped-w" aria-label="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped tooltipped-w"
      aria-label="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-x flash-close js-ajax-error-dismiss" aria-label="Dismiss error"></a>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-af95b05cb14b7a29b0457c26b4a1d24151f4a47842c8e74bd556622f347b9d3d.js" type="text/javascript"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github-469a491e7f20dfe1ceb7a984cf2e822ec164f848807b41dfe935371c215db4ee.js" type="text/javascript"></script>
      
      
  </body>
</html>

