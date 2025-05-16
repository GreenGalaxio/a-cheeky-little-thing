// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_entrance_new_9

package lloyd_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.xml.*;

    public dynamic class lloyd_entrance_new_9 extends MovieClip 
    {

        public function lloyd_entrance_new_9()
        {
            addFrameScript(0, this.frame1, 58, this.frame59);
        }

        internal function frame1():*
        {
            if (((parent) && (SSF2API.isReady())))
            {
                SSF2API.getCharacter(this).setGlobalVariable("MaxArtes", 3);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                SSF2API.getCharacter(this).setGlobalVariable("artesNumber", 0);
            };
        }

        internal function frame59():*
        {
            SSF2API.getCharacter(this).endAttack();
        }


    }
}//package lloyd_fla

