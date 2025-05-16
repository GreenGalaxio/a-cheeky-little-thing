// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//stareffect

package 
{
    import flash.display.MovieClip;

    public dynamic class stareffect extends MovieClip 
    {

        public function stareffect()
        {
            addFrameScript(38, this.frame39);
        }

        internal function frame39():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

