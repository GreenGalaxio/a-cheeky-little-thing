// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioman_run_33

package wario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class warioman_run_33 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function warioman_run_33()
        {
            addFrameScript(0, this.frame1, 20, this.frame21, 21, this.frame22, 28, this.frame29);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame21():*
        {
            gotoAndPlay("run");
        }

        internal function frame22():*
        {
            SSF2API.playSound("Run_start");
        }

        internal function frame29():*
        {
            gotoAndPlay("run");
        }


    }
}//package wario_fla

