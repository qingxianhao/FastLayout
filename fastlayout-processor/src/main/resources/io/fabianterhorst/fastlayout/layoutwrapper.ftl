package ${package};

import android.content.Context;
import android.util.AttributeSet;
//Todo : find full class name
import android.view.*;
import android.widget.*;

import static android.view.ViewGroup.LayoutParams.WRAP_CONTENT;
import static android.view.ViewGroup.LayoutParams.MATCH_PARENT;

/*${log}*/

public class ${keyWrapperClassName} extends ${rootLayout.name} {

    public ${keyWrapperClassName}(Context context) {
        super(context);
        init();
    }

    public ${keyWrapperClassName}(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public ${keyWrapperClassName}(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    public ${keyWrapperClassName}(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    private void init() {
        ${rootLayout.layoutParams.name} ${rootLayout.id}LayoutParams = new ${rootLayout.layoutParams.name}(${rootLayout.layoutParams.width}, ${rootLayout.layoutParams.height});
        this.setLayoutParams(${rootLayout.id}LayoutParams);
        <#assign parent = "this">
        <#list rootLayout.children as child>
        ${child.name} ${child.id} = new ${child.name}(getContext());
        ${child.layoutParams.name} ${child.id}LayoutParams = new ${child.layoutParams.name}(${child.layoutParams.width}, ${child.layoutParams.height});
        ${child.id}.setLayoutParams(${child.id}LayoutParams);
        <#if child.hasChildren>
        <#assign parent = child.id>
        <#else>
        ${parent}.addView(${child.id});
        </#if>
        </#list>
    }
}