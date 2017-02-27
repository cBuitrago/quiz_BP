{strip}
    <html>
        {include file="com/novaconcept/page/smarty/includes/HeadTag.tpl" lang=$lang head=$head view=$view}
        <body>
            {include file="com/novaconcept/page/smarty/includes/NavTag.tpl" lang=$lang head=$head view=$view}
            <article class="container">
                <article class="aside">
                    {include file="com/novaconcept/page/smarty/includes/Aside.tpl" lang=$lang head=$head view=$view}
                </article>
                <article class="center">
                    {include file=$view->center lang=$lang head=$head view=$view}
                </article>
            </article>
            <footer>
                <div class="footer">
                    <p>{$lang->includes->footer}</p>
                </div>
            </footer>
            <div class="modal" id="msgModal" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="icon-remove" aria-hidden="true"></span></button>
                        </div>
                        <div class="modal-body">
                            <h1 id="errorMsg"></h1>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>
{/strip}