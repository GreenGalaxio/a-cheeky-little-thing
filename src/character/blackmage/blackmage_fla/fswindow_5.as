// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.fswindow_5

package blackmage_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class fswindow_5 extends MovieClip 
    {

        public var self:*;

        public function fswindow_5()
        {
            addFrameScript(0, this.frame1, 549, this.frame550, 636, this.frame637);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
        }

        internal function frame550():*
        {
            SSF2API.playSound("bm_Enemydie2");
        }

        internal function frame637():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package blackmage_fla

