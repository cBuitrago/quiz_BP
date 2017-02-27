{strip}
    <html>
        {include file="com/novaconcept/page/smarty/includes/HeadTag.tpl" lang=$lang head=$head view=$view}
        <body>
            {include file="com/novaconcept/page/smarty/includes/NavTag.tpl" lang=$lang head=$head view=$view}
            <article class="container">
                <article class="aside">
                    {include file="com/novaconcept/page/smarty/includes/Aside.tpl" lang=$lang head=$head}
                </article>
                <article class="center">
                    <h1>Forbidden</h1>
                </article>
            </article>
            <footer>
                <div class="footer">
                    <p>{$lang->includes->footer}</p>
                </div>
            </footer>
        </body>
    </html>
{/strip}
