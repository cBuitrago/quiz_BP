{if isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE }
    <div>
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#infoCorpo" aria-controls="home" role="tab" data-toggle="tab">Compagnie</a>
            </li>
            <li role="presentation">
                <a href="#settingsCorpo" aria-controls="home" role="tab" data-toggle="tab">Réglages</a>
            </li>
        </ul>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active bg-image" id="infoCorpo">
                <div class="editItem">
                    <h1>Éditer Compagnie</h1>
                    <p>Nom de la compagnie</p>
                    <form id="edit_department_form" method="post">
                        <input type="hidden"    name="id"           id="id"             value="{$data->corpo->id}">
                        <input type="hidden"    name="description"  id="description"    value="IS_CORPO">
                        <input type="hidden"    name="parent"       id="parent"         value="{$data->corpo->parent}">
                        <input type="text"      name="name"         id="name"           value="{$data->corpo->name}" class="editInput" >
                        <div class="double-input">
                            <button type="button" class="cancel" id="cancelAll" 
                                    data-toggle="tooltip" data-placement="left" title="">
                                Annuler
                            </button>
                            <button type="button" class="nv-btn-default nv-principal-color" id="onDepartmentEdit" 
                                    data-toggle="tooltip" data-placement="left" title="editer le nom du corpo">
                                Éditer
                            </button>
                        </div>
                    </form>
                </div>
                <div class="addItem">
                    <h1>Groupes de la compagnie</h1>
                    <table class="">
                        <tbody>
                            {foreach from=$data->groups item=group}
                                <tr>
                                    <td>
                                        <a class="" href="{$head->baseUrl}/{$smarty.session.accountInfo}/group/{$group->id}">{$group->name}</a>
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="settingsCorpo">
                <form id="update_image_settings" method="post" enctype="multipart/form-data">
                    <div class="containerEdit">
                        <div class="single-input">
                            <input type="file" name="imgCompany" id="imgCompany">
                        </div>
                        <div class="double-input">
                            <button type="button" class="cancel cancelAll" 
                                    data-toggle="tooltip" data-placement="left" title="">
                                Annuler
                            </button>
                            <button type="submit" class="nv-btn-default nv-principal-color" id="" name="uploadImage"
                                    data-toggle="tooltip" data-placement="left" title="">
                                Ajouter Image
                            </button>
                        </div>
                    </div>
                </form>
                <form id="edit_settings_form">
                    <input type="hidden" name="logo" id="logo" value="{$data->settings->logo}">
                    <div class="containerEdit">
                        <h1>Éditer des couleurs</h1>
                        <div class="double-input">
                            <div>
                                <label for="c1">btn-cancel</label>
                                <div id="btn-cancel" class="input-group colorpicker-component">
                                    <input type="text" name="btn_cancel" value="{$data->settings->colors->btn_cancel}" class="form-control" id="c1"/>
                                    <span class="input-group-addon"><i></i></span>
                                </div>
                                <script>
                                    $(function () {
                                        $('#btn-cancel').colorpicker().on('changeColor', function (e) {
                                            $('.cancel').each(function () {
                                                $(this)[0].style.backgroundColor = e.color.toString('rgba');
                                            });
                                        });
                                    });
                                </script>
                            </div>
                            <div>
                                <label for="c2">btn</label>
                                <div id="btn" class="input-group colorpicker-component">
                                    <input type="text" name="principal" value="{$data->settings->colors->principal}" class="form-control" id="c2" />
                                    <span class="input-group-addon"><i></i></span>
                                </div>
                                <script>
                                    $(function () {
                                        $('#btn').colorpicker().on('changeColor', function (e) {
                                            $('.nv-btn-default').each(function () {
                                                $(this)[0].style.backgroundColor = e.color.toString('rgba');
                                            });
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                        <div class="single-input">
                            <label for="c3">Aside</label>
                            <div id="color-aside" class="input-group colorpicker-component">
                                <input type="text" name="aside" value="{$data->settings->colors->aside}" class="form-control" id="c3" />
                                <span class="input-group-addon"><i></i></span>
                            </div>
                            <script>
                                $(function () {
                                    $('#color-aside').colorpicker().on('changeColor', function (e) {
                                        $('article.aside')[0].style.backgroundColor = e.color.toString('rgba');
                                    });
                                });
                            </script>
                        </div>
                        <div class="double-input">
                            <div>
                                <label for="c4">Nav</label>
                                <div id="nav" class="input-group colorpicker-component">
                                    <input type="text" name="nav" value="{$data->settings->colors->nav}" class="form-control" id="c4" />
                                    <span class="input-group-addon"><i></i></span>
                                </div>
                                <script>
                                    $(function () {
                                        $('#nav').colorpicker().on('changeColor', function (e) {
                                            $('nav')[0].style.backgroundColor = e.color.toString('rgba');
                                            $('nav div.image')[0].style.backgroundColor = e.color.toString('rgba');
                                        });
                                    });
                                </script>
                            </div>
                            <div>
                                <label for="c5">Nav 2</label>
                                <div id="nav2" class="input-group colorpicker-component">
                                    <input type="text" name="nav2" value="{$data->settings->colors->nav2}" class="form-control" id="c5" />
                                    <span class="input-group-addon"><i></i></span>
                                </div>
                                <script>
                                    $(function () {
                                        $('#nav2').colorpicker().on('changeColor', function (e) {
                                            $('ul.nav-tabs')[0].style.backgroundColor = e.color.toString('rgba');
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                        <div class="double-input">
                            <button type="button" class="cancel cancelAll" 
                                    data-toggle="tooltip" data-placement="left" title="">
                                Annuler
                            </button>
                            <button type="button" class="nv-btn-default nv-principal-color" id="editSettings" 
                                    data-toggle="tooltip" data-placement="left" title="editer info de l'utilisateur">
                                Éditer
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
{/if}