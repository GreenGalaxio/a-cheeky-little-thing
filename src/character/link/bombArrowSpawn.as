// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//bombArrowSpawn

package 
{
    import flash.display.MovieClip;

    public dynamic class bombArrowSpawn extends MovieClip 
    {

        public function bombArrowSpawn()
        {
            addFrameScript(8, this.frame9);
        }

        internal function frame9():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

